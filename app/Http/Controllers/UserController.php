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

    public function komoditas_kecamatan()
    {
        $kecamatan = DB::select('CALL viewAll_kecamatan()');

        return view('user.komoditas_kecamatan', compact('kecamatan'));
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
        $paginator = new LengthAwarePaginator(
            array_slice($komoditas, ($page - 1) * $perPage, $perPage),
            count($komoditas),
            $perPage,
            $page,
            ['path' => url()->current()]
        );


        return response()->json([
            'data' => $paginator->items(),
            'current_page' => $paginator->currentPage(),
            'last_page' => $paginator->lastPage(),
            'total' => $paginator->total(),
            'per_page' => $paginator->perPage()
        ]);
    }


    public function persebaran_komoditas()
    {
        $komoditas = DB::select('CALL viewAll_komoditas()');
        return view('user.persebaran_komoditas', compact('komoditas'));
    }

    public function getPersebaranKomoditas(Request $request, $id)
    {
        $perPage = 6;
        $page = $request->query('page', 1);

        if ($id === "all") {
            $data = DB::select('CALL viewAll_persebaranKomoditas()');
        } else {
            $data = DB::select('CALL view_persebaranKomoditas(?)', [$id]);
        }

        $paginator = new LengthAwarePaginator(
            array_slice($data, ($page - 1) * $perPage, $perPage),
            count($data),
            $perPage,
            $page,
            ['path' => url()->current()]
        );

        return response()->json([
            'data' => $paginator->items(),
            'current_page' => $paginator->currentPage(),
            'last_page' => $paginator->lastPage(),
            'total' => $paginator->total(),
            'per_page' => $paginator->perPage()
        ]);
    }


    public function harga()
    {

        $pasar = DB::select('CALL viewAll_pasar()');
        return view('user/harga', compact('pasar'));
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
        $paginator = new LengthAwarePaginator(
            array_slice($harga, ($page - 1) * $perPage, $perPage),
            count($harga),
            $perPage,
            $page,
            ['path' => url()->current()]
        );

        return response()->json([
            'data' => $paginator->items(),
            'current_page' => $paginator->currentPage(),
            'last_page' => $paginator->lastPage(),
            'total' => $paginator->total(),
            'per_page' => $paginator->perPage()
        ]);
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
