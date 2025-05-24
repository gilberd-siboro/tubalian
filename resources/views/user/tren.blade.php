@extends('layout.user.nav')
@section('content')

<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('images/tren-harga.jpg');">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
            <div class="col-md-9 ftco-animate pb-5 text-center">
                <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Beranda <i class="fa fa-chevron-right"></i></a></span> <span>Tren Harga Komoditas<i class="fa fa-chevron-right"></i></span></p>
                <h1 class="mb-0 bread">Tren Harga Komoditas</h1>
            </div>
        </div>
    </div>
</section>
<section class="ftco-section">
    <div class="container">
        <div class="row mb-4">
            <div class="col-md-4">
                <select id="filterKomoditas" class="form-control">
                    <option value="all">Semua Komoditas</option>
                    @foreach ($komoditas as $kom)
                    <option value="{{ $kom->id_komoditas }}"> {{ $kom->nama_komoditas }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-4">
                <select id="filterPasar" class="form-control">
                    <option value="all">Semua Pasar</option>
                    @foreach ($pasar as $pas)
                    <option value="{{ $pas->id_pasar }}"> {{ $pas->nama_pasar }}</option>
                    @endforeach
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <canvas id="hargaChart"></canvas>
            </div>
        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Fungsi untuk mengambil data harga berdasarkan filter komoditas dan pasar
    function getChartData(komoditas = 'all', pasar = 'all') {
        let url = `/get-harga-pasar?komoditas=${komoditas}&pasar=${pasar}`;

        fetch(url)
            .then(response => response.json())
            .then(data => {
                updateChart(data); // Update chart setelah data diterima
            })
            .catch(error => console.error('Error fetching data:', error));
    }

    // Update Chart dengan data yang diterima
    function updateChart(data) {
        // Menyusun data untuk chart
        const labels = [...new Set(data.map(item => item.tanggal))]; // Mengambil tanggal unik
        const datasets = [];

        // Menyusun dataset untuk setiap komoditas dan pasar
        const komoditasPasarMap = new Map(); // Map untuk menyimpan harga berdasarkan komoditas dan pasar
        data.forEach(item => {
            const key = `${item.nama_komoditas}-${item.nama_pasar}`; // Kunci unik berdasarkan komoditas dan pasar
            if (!komoditasPasarMap.has(key)) {
                komoditasPasarMap.set(key, {
                    label: `${item.nama_komoditas} - ${item.nama_pasar}`,
                    data: Array(labels.length).fill(null), // Inisialisasi data untuk setiap label
                    borderColor: getRandomColor(), // Warna acak untuk setiap garis
                    borderWidth: 2,
                    fill: false,
                    spanGaps: true,
                });
            }

            // Menyisipkan harga sesuai tanggal
            const index = labels.indexOf(item.tanggal);
            const dataset = komoditasPasarMap.get(key);
            dataset.data[index] = item.harga; // Masukkan harga pada tanggal yang sesuai
        });

        // Mengubah Map menjadi array datasets
        komoditasPasarMap.forEach((dataset) => {
            datasets.push(dataset);
        });

        // Jika chart sudah ada, hancurkan dan buat yang baru
        if (window.chart) {
            window.chart.destroy();
        }

        // Menyusun chart dengan dataset yang telah dibuat
        const ctx = document.getElementById('hargaChart').getContext('2d');
        window.chart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: labels,
                datasets: datasets
            },
            options: {
                responsive: true,
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: 'Tanggal'
                        }
                    },
                    y: {
                        title: {
                            display: true,
                            text: 'Harga'
                        },
                        beginAtZero: false
                    }
                }
            }
        });
    }

    // Fungsi untuk menghasilkan warna acak
    function getRandomColor() {
        const letters = '0123456789ABCDEF';
        let color = '#';
        for (let i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }

    // Event Listener untuk perubahan filter
    document.getElementById('filterKomoditas').addEventListener('change', function() {
        const komoditas = this.value;
        const pasar = document.getElementById('filterPasar').value;
        getChartData(komoditas, pasar);
    });

    document.getElementById('filterPasar').addEventListener('change', function() {
        const pasar = this.value;
        const komoditas = document.getElementById('filterKomoditas').value;
        getChartData(komoditas, pasar);
    });

    // Panggil getChartData saat halaman pertama kali dibuka dengan filter 'all'
    document.addEventListener('DOMContentLoaded', function() {
        getChartData('all', 'all'); // Memastikan chart otomatis terupdate dengan filter 'all' saat halaman dibuka
    });
</script>
@endsection