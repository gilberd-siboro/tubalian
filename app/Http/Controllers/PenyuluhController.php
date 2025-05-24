<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PenyuluhController extends Controller
{
    public function penyuluh()
    {
        $userData = session('userData');
        $petani = DB::select('CALL viewAll_petani()');
        $totalPetani = count($petani);
        $kelompokTani = DB::select('CALL viewAll_kelompokTani()');
        $totalKel = count($kelompokTani);
        $komoditas = DB::select('CALL viewAll_Komoditas()');
        $totalKom = count($komoditas);
        $pasar = DB::select('CALL viewAll_pasar()');
        $totalPsr = count($pasar);

        return view('penyuluh/index', compact('userData', 'totalPetani', 'totalKel', 'totalKom', 'totalPsr', 'komoditas', 'pasar'));
    }

    public function getHargaKomoditasChart(Request $request)
    {
        $idKomoditas = $request->input('id_komoditas');
        $idPasar = $request->input('id_pasar');

        $results = DB::select('CALL get_harga_komoditas(?, ?)', [$idKomoditas, $idPasar]);

        $data = [];

        foreach ($results as $row) {
            // Karena tanggal dari stored procedure sudah dalam format 'Y-m-d'
            if (!$row->tanggal) continue;

            $dateObj = new \DateTime($row->tanggal);
            $tanggal = $dateObj->format('M Y'); // Contoh: 'Feb 2025'

            if (!isset($data[$tanggal])) {
                $data[$tanggal] = [
                    'tanggal' => $tanggal,
                    'high' => $row->harga_tertinggi,
                    'low' => $row->harga_terendah,
                ];
            } else {
                $data[$tanggal]['high'] = max($data[$tanggal]['high'], $row->harga_tertinggi);
                $data[$tanggal]['low'] = min($data[$tanggal]['low'], $row->harga_terendah);
            }
        }

        // Siapkan response sesuai kebutuhan chart di JS
        $response = [
            'categories' => array_keys($data),
            'high' => array_column($data, 'high'),
            'low' => array_column($data, 'low'),
        ];

        return response()->json($response);
    }

    // ---------------- Data Pertanian --------------------

    public function data_pertanian()
    {
        $userData = session('userData');
        $dataPertanian = DB::select('CALL viewAll_dataPertanian()');
        $totalData = count($dataPertanian); // Menghitung jumlah data

        return view('penyuluh/data/index', compact('userData', 'dataPertanian', 'totalData'));
    }


    public function tambah_data_pertanian()
    {
        $userData = session('userData');
        $petani = DB::select('CALL viewAll_petani()');
        $lahan = DB::select('CALL viewAll_lahan()');
        $desa = DB::select('CALL viewAll_desa()');
        $komoditas = DB::select('CALL viewAll_Komoditas()');
        $dataPertanian = DB::select('CALL viewAll_dataPertanian()');
        $totalData = count($dataPertanian); // Menghitung jumlah data

        return view('penyuluh/data/tambah', compact('userData', 'petani', 'lahan', 'desa', 'komoditas', 'dataPertanian', 'totalData'));
    }
    public function create_data_pertanian(Request $request)
    {
        // Validasi file gambar
        $request->validate([
            'gambar' => 'required',
            'gambar.*' => 'image|mimes:jpeg,png,jpg|max:2048'
        ]);

        $gambarPaths = [];

        if ($request->hasFile('gambar')) {
            foreach ($request->file('gambar') as $file) {
                $fileName = time() . '_' . $file->getClientOriginalName(); // Buat nama unik
                $destinationPath = public_path('assets/images'); // Simpan di public/assets/images
                $file->move($destinationPath, $fileName); // Pindahkan file

                $gambarPaths[] = $fileName; // Simpan path relatif jika diperlukan
            }
        }


        // Menyiapkan data untuk disimpan
        $DataPertanian = json_encode([
            'Petani' => $request->get('id_petani'),
            'Lahan' => $request->get('id_lahan'),
            'Komoditas' => $request->get('id_komoditas'),
            'LuasLahan' => $request->get('luas_lahan'),
            'Desa' => $request->get('subdis_id'),
            'Alamat' => $request->get('alamat_lengkap'),
            'TanggalTanam' => $request->get('tanggal_tanam'),
            'TanggalCatat' => $request->get('tanggal_pencatatan'),
            'Pencatat' => session('userData')->user_id,
            'GambarLahan' => $gambarPaths,
            'Latitude' => $request->get('latitude'),
            'Longitude' => $request->get('longitude'),

        ]);

        // dd($DataPertanian);

        try {
            // Jalankan stored procedure dan ambil hasil SELECT
            $result = DB::select('CALL insert_dataPertanian(:dataPertanian)', [
                'dataPertanian' => $DataPertanian
            ]);
            // dd($result);
            // Ambil nilai 'status' dari hasil stored procedure
            $status = $result[0]->STATUS ?? 'ERROR';

            if ($status === 'SUCCESS') {
                toast('Data berhasil ditambahkan!', 'success')->autoClose(3000);
            } else {
                toast('Data gagal disimpan!', 'error')->autoClose(3000);
            }
            return redirect()->route('dataPertanian.index');
        } catch (\Exception $e) {
            toast('Terjadi kesalahan: ' . $e->getMessage(), 'error')->autoClose(5000);
            return redirect()->route('dataPertanian.index');
        }
    }


    public function edit($id)
    {
        $userData = session('userData');
        $petani = DB::select('CALL viewAll_petani()');
        $lahan = DB::select('CALL viewAll_lahan()');
        $desa = DB::select('CALL viewAll_desa()');
        $komoditas = DB::select('CALL viewAll_Komoditas()');
        $dataPertanianData = DB::select('CALL view_dataPertanianById(' . $id . ')');
        $dataPertanian = $dataPertanianData[0];

        $gambarArray = [];
        if (!empty($dataPertanian->gambar_lahan)) {
            $gambarArray = explode(',', $dataPertanian->gambar_lahan);
        }
        return view('penyuluh/data/edit', compact('userData', 'petani', 'lahan', 'desa', 'komoditas', 'dataPertanian', 'gambarArray'));
    }

    public function update(Request $request, $id)
    {
        // Proses update data pertanian
        $DataPertanian = json_encode([
            'IdDataPertanian' => $id,
            'Petani' => $request->get('id_petani'),
            'Lahan' => $request->get('id_lahan'),
            'Komoditas' => $request->get('id_komoditas'),
            'LuasLahan' => $request->get('luasLahan'),
            'Desa' => $request->get('subdis_id'),
            'Alamat' => $request->get('alamatLengkap'),
            'TanggalTanam' => $request->get('tanggal_tanam'),
            'TanggalCatat' => $request->get('tanggal_pencatatan'),
            'Latitude' => $request->get('latitude'),
            'Longitude' => $request->get('longitude'),
        ]);

        // Update data pertanian di database
        $dataPertanianData = DB::select('CALL view_dataPertanianById(' . $id . ')');
        $dataPertanian = $dataPertanianData[0];

        if ($dataPertanian) {
            $response = DB::statement('CALL update_DataPertanian(:dataPertanian)', ['dataPertanian' => $DataPertanian]);

            if ($response) {
                // Cek jika ada gambar yang di-upload
                if ($request->hasFile('gambar')) {
                    $files = $request->file('gambar');
                    foreach ($files as $file) {
                        // Buat nama file unik berdasarkan timestamp dan nama asli file
                        $fileName = time() . '_' . $file->getClientOriginalName();
                        $destinationPath = public_path('assets/images'); // Path tempat menyimpan gambar

                        // Pindahkan file ke folder public/assets/images
                        $file->move($destinationPath, $fileName);

                        // Dapatkan path gambar yang disimpan
                        $path = $fileName;

                        // Panggil stored procedure untuk memasukkan gambar ke dalam tabel gambar_lahan
                        $response = DB::statement('CALL insert_gambar(:dataGambar)', [
                            'dataGambar' => json_encode([
                                'DataPertanian' => $id,
                                'UrlGambar' => $path,  // $path adalah URL gambar yang disimpan
                            ])
                        ]);
                    }
                }



                toast('Data berhasil diupdate!', 'success')->autoClose(3000);
                return redirect()->route('dataPertanian.index');
            } else {
                toast('Data gagal disimpan!', 'error')->autoClose(3000);
                return redirect()->route('dataPertanian.index');
            }
        } else {
            toast('Data tidak ditemukan!', 'error')->autoClose(3000);
            return redirect()->route('dataPertanian.index');
        }
    }

    public function deleteGambar($id)
    {
        // Call the stored procedure to delete the image by id
        DB::statement('CALL delete_gambar(?)', [$id]);

        // Redirect or return a response
        return redirect()->back()->with('success', 'Gambar berhasil dihapus');
    }
    public function detail($id)
    {
        $userData = session('userData');

        // Call the stored procedure
        $dataPertanianData = DB::select('CALL view_dataDetailId(' . $id . ')');


        // Akses data pertama
        $dataPertanian = $dataPertanianData[0];

        // Ubah string gambar_lahan dan id_gambar menjadi array
        $gambarUrls = explode(',', $dataPertanian->gambar_lahan);
        $idGambars = explode(',', $dataPertanian->id_gambar);

        // Array untuk gambar
        $gambarArray = [];
        foreach ($gambarUrls as $index => $url) {
            $gambarArray[] = [
                'id' => $idGambars[$index] ?? null,
                'url' => $url,
            ];
        }

        // Return view with data
        return view('penyuluh/data/detail', compact('userData', 'dataPertanian', 'gambarArray'));
    }



    public function delete(Request $request, $id)
    {
        $response = DB::statement('CALL delete_dataPertanian(?)', [$id]);

        if ($response) {
            toast('Data berhasil dihapus!', 'success')->autoClose(3000);
        } else {
            toast('Data gagal dihapus!', 'error')->autoClose(3000);
        }

        return redirect()->route('dataPertanian.index');
    }

    # ----- Harga Komoditas -----------

    public function harga()
    {
        $userData = session('userData');
        $pasar = DB::select('CALL viewAll_pasar()');
        $komoditas = DB::select('CALL viewAll_Komoditas()');
        $harga = DB::select('CALL viewAll_hargaKomoditas()');
        $totalData = count($harga);

        return view('penyuluh/harga/index', compact('totalData', 'userData', 'pasar', 'komoditas', 'harga'));
    }


    public function create_harga(Request $request)
    {
        $Harga = json_encode([
            'Harga' => $request->get('harga'),
            'Tanggal' => $request->get('tanggal'),
            'Pasar' => $request->get('pasar'),
            'Komoditas' => $request->get('komoditas'),
        ]);

        $response = DB::statement('CALL insert_harga(:dataHarga)', ['dataHarga' => $Harga]);

        if ($response) {
            toast('Data berhasil ditambahkan!', 'success')->autoClose(3000);
            return redirect()->route('harga.index');
        } else {
            toast('Data gagal disimpan!', 'error')->autoClose(3000);
            return redirect()->route('harga.index');
        }
    }

    public function edit_harga($id)
    {
        $userData = session('userData');
        $pasar = DB::select('CALL viewAll_pasar()');
        $komoditas = DB::select('CALL viewAll_Komoditas()');
        $hargaData = DB::select('CALL view_hargaKomoditasById(' . $id . ')');
        $harga = $hargaData[0];


        return view('penyuluh/harga/edit', compact('userData', 'pasar', 'komoditas', 'harga'));
    }

    public function update_harga(Request $request, $id)
    {
        $Harga = json_encode([
            'IdHarga' => $id,
            'Harga' => $request->get('harga'),
            'Tanggal' => $request->get('tanggal'),
            'Pasar' => $request->get('pasar'),
            'Komoditas' => $request->get('komoditas'),
        ]);



        $hargaData = DB::select('CALL view_hargaKomoditasById(' . $id . ')');
        $harga = $hargaData[0];

        if ($harga) {
            $response = DB::statement('CALL update_harga(:dataHarga)', ['dataHarga' => $Harga]);

            if ($response) {
                toast('Data berhasil Di update!', 'success')->autoClose(3000);
                return redirect()->route('harga.index');
            } else {
                toast('Data gagal disimpan!', 'error')->autoClose(3000);
                return redirect()->route('harga.index');
            }
        } else {
            toast('Data tidak ditemukan!', 'error')->autoClose(3000);
            return redirect()->route('harga.index');
        }
    }

    public function delete_harga($id)
    {
        $response = DB::statement('CALL delete_harga(?)', [$id]);

        if ($response) {
            toast('Data berhasil dihapus!', 'success')->autoClose(3000);
        } else {
            toast('Data gagal dihapus!', 'error')->autoClose(3000);
        }

        return redirect()->route('harga.index');
    }
}
