<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Pagination\LengthAwarePaginator;

class UserController extends Controller
{
    public function index()
    {
        $beritaAll = DB::select('CALL viewAll_beritaIndex()');
        $berita = array_slice($beritaAll, 0, 3);
        return view('user/index', compact('berita'));
    }
    public function tentang()
    {
        return view('user/tentang');
    }
    public function berita(Request $request)
    {
        $perPage = 5;
        $page = request()->query('page', 1);
        $beritaRaw = DB::select('CALL viewAll_beritaIndex()');
        $berita = new LengthAwarePaginator(
            array_slice($beritaRaw, ($page - 1) * $perPage, $perPage),
            count($beritaRaw),
            $perPage,
            $page,
            ['path' => url()->current()]
        );

        return view('user/berita', compact('berita'));
    }

    public function isiBerita($id)
    {
        $beritaData = DB::select('CALL view_beritaById(' . $id . ')');
        $berita = $beritaData[0];

        return view('user/isiberita', compact('berita'));
    }

    public function getKomoditasByKecamatan(Request $request, $id)
    {
        $perPage = 6; // Jumlah item per halaman
        $page = $request->query('page', 1); // Ambil parameter halaman dari request

        if ($id === "all") {
            $komoditas = DB::select('CALL viewAll_komoditasKecamatan()');
        } else {
            $komoditas = DB::select('CALL view_komoditasByKecamatan(?)', [$id]);
        }

        // Konversi array hasil query menjadi Laravel paginator secara manual
        $komoditasPaginated = new LengthAwarePaginator(
            array_slice($komoditas, ($page - 1) * $perPage, $perPage), // Data sesuai halaman
            count($komoditas), // Total jumlah data
            $perPage,
            $page,
            ['path' => url()->current()] // URL dasar untuk pagination
        );

        return response()->json($komoditasPaginated);
    }

    public function komoditas_kecamatan()
    {
        $kecamatan = DB::select('CALL viewAll_kecamatan()');

        // Ambil data awal dengan pagination
        $komoditasRaw = DB::select('CALL viewAll_komoditasKecamatan()');
        $perPage = 6;
        $page = request()->query('page', 1);
        $komoditas = new LengthAwarePaginator(
            array_slice($komoditasRaw, ($page - 1) * $perPage, $perPage),
            count($komoditasRaw),
            $perPage,
            $page,
            ['path' => url()->current()]
        );

        return view('user.komoditas_kecamatan', compact('kecamatan', 'komoditas'));
    }
    public function persebaran_komoditas()
    {
        $komoditas = DB::select('CALL viewAll_komoditas()');

        // Ambil data awal dengan pagination
        $persebaranRaw = DB::select('CALL viewAll_persebaranKomoditas()');
        $perPage = 6;
        $page = request()->query('page', 1);
        $persebaran = new LengthAwarePaginator(
            array_slice($persebaranRaw, ($page - 1) * $perPage, $perPage),
            count($persebaranRaw),
            $perPage,
            $page,
            ['path' => url()->current()]
        );

        return view('user/persebaran_komoditas', compact('komoditas', 'persebaran'));
    }

    public function getPersebaranKomoditas(Request $request, $id)
    {
        $perPage = 6; // Jumlah item per halaman
        $page = $request->query('page', 1); // Ambil parameter halaman dari request

        if ($id === "all") {
            $persebaran = DB::select('CALL viewAll_persebaranKomoditas()');
        } else {
            $persebaran = DB::select('CALL view_persebaranKomoditas(?)', [$id]);
        }

        // Konversi array hasil query menjadi Laravel paginator secara manual
        $persebaranPaginated = new LengthAwarePaginator(
            array_slice($persebaran, ($page - 1) * $perPage, $perPage), // Data sesuai halaman
            count($persebaran), // Total jumlah data
            $perPage,
            $page,
            ['path' => url()->current()] // URL dasar untuk pagination
        );

        return response()->json($persebaranPaginated);
    }


    public function harga()
    {

        $hargaRaw = DB::select('CALL viewAll_latestHarga()');
        $pasar = DB::select('CALL viewAll_pasar()');
        $perPage = 6;
        $page = request()->query('page', 1);
        $harga = new LengthAwarePaginator(
            array_slice($hargaRaw, ($page - 1) * $perPage, $perPage),
            count($hargaRaw),
            $perPage,
            $page,
            ['path' => url()->current()]
        );
        return view('user/harga', compact('pasar', 'harga'));
    }

    // view_hargaByPasar

    public function getHarga(Request $request, $id)
    {
        $perPage = 6; // Jumlah item per halaman
        $page = $request->query('page', 1); // Ambil parameter halaman dari request

        if ($id === "all") {
            $harga = DB::select('CALL viewAll_latestHarga()');
        } else {
            $harga = DB::select('CALL view_hargaByPasar(?)', [$id]);
        }

        // Konversi array hasil query menjadi Laravel paginator secara manual
        $hargaPaginated = new LengthAwarePaginator(
            array_slice($harga, ($page - 1) * $perPage, $perPage), // Data sesuai halaman
            count($harga), // Total jumlah data
            $perPage,
            $page,
            ['path' => url()->current()] // URL dasar untuk pagination
        );

        return response()->json($hargaPaginated);
    }

    public function getHargaPasar(Request $request)
    {
        // Ambil parameter filter komoditas dan pasar dari request
        $komoditas = $request->komoditas;
        $pasar = $request->pasar;

        // Memanggil stored procedure 'view_trenHarga'
        $data = DB::select('CALL view_trenHarga(?, ?)', [
            $komoditas === 'all' ? null : $komoditas, // Jika 'all', maka NULL
            $pasar === 'all' ? null : $pasar         // Jika 'all', maka NULL
        ]);

        // Mengembalikan data dalam format JSON
        return response()->json($data);
    }
    public function tren()
    {

        $komoditas = DB::select('CALL viewAll_Komoditas()');
        $pasar = DB::select('CALL viewAll_pasar()');
        return view('user/tren', compact('komoditas', 'pasar'));
    }
}
