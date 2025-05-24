<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use RealRashid\SweetAlert\Facades\Alert;

class AuthController extends Controller
{
    public function showLoginForm()
    {
        return view('auth.login');
    }

    public function proses_login(Request $request)
    {
        // Validasi form input
        $request->validate([
            'username' => 'required|string|max:16',
            'password' => ['required', 'regex:/^[a-zA-Z0-9]+$/'],
        ]);

        // Ambil inputan
        $credential = $request->only('username', 'password');

        // Cek apakah username ada di database
        $user = DB::table('users')->where('username', $request->username)->first();

        // Cek kredensial menggunakan Auth::attempt
        if ($user && Auth::attempt($credential)) {
            $user = Auth::user();
            $userRole = $user->roles->role_name; // Ambil role dari user yang sedang login

            $userData = DB::table('users')
                ->select('users.user_id', 'users.username', 'users.personal_id', 'pegawai.namaPegawai')
                ->leftJoin('pegawai', 'users.personal_id', '=', 'pegawai.idPegawai')
                ->where('users.user_id', $user->user_id)
                ->first();

            session(['userData' => $userData]);

            if ($userRole == 'Admin') {
                return redirect()->route('admin.dashboard');
            } elseif ($userRole == 'Penyuluh') {
                return redirect()->route('penyuluh.dashboard');
            }

            return redirect()->intended('/');
        }

        // Jika user tidak ditemukan atau kredensial salah
        if (!$user) {
            return redirect('login')
                ->withInput()
                ->withErrors(['login_gagal' => 'Username yang Anda masukkan tidak terdaftar.']);
        } elseif (!Auth::attempt($credential)) {
            return redirect('login')
                ->withInput()
                ->withErrors(['login_gagal' => 'Password yang Anda masukkan salah.']);
        }

        // Jika error tidak diketahui
        return redirect('login')
            ->withInput()
            ->withErrors(['login_gagal' => 'Terjadi kesalahan saat mencoba login.']);
    }


    public function logout(Request $request)
    {
        Auth::logout(); // Keluar dari sistem

        $request->session()->invalidate(); // Hapus semua sesi agar tidak bisa digunakan kembali
        $request->session()->regenerateToken(); // Regenerasi CSRF token untuk keamanan

        toast('Anda berhasil logout!', 'success')->autoClose(3000); // Auto close dalam 3 detik
        return redirect()->route('home');
    }
}
