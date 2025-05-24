@extends('layout.user.nav')
@section('content')

<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('images/harga_komoditas.jpg');">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
            <div class="col-md-9 ftco-animate pb-5 text-center">
                <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Beranda <i class="fa fa-chevron-right"></i></a></span> <span>Harga Komoditas <i class="fa fa-chevron-right"></i></span></p>
                <h1 class="mb-0 bread">Harga Komoditas</h1>
            </div>
        </div>
    </div>
</section>


<section class="ftco-section">
    <div class="container">
        <!-- Dropdown Filter Pasar -->
        <div class="row mb-4">
            <div class="col-md-4">
                <select id="filterPasar" class="form-control">
                    <option value="all">Semua Pasar</option>
                    @foreach ($pasar as $p)
                    <option value="{{ $p->id_pasar }}"> {{ $p->nama_pasar }}</option>
                    @endforeach
                </select>
            </div>
        </div>


        <div class="row" id="hargaContainer">
            @foreach ($harga as $item)
            <div class="col-md-4 ftco-animate" data-pasar="{{ $item->nama_pasar }}">
                <div class="project-wrap">
                    <a href="" class="img" style="background-image:url('{{ asset('assets/images/' . $item->gambar) }}');">
                        <span class="price"> Rp{{ number_format($item->harga, 0, ',', '.') }}/kg</span>
                    </a>
                    <div class="text p-4">
                        <h3><a href="#">{{ $item->nama_komoditas }}</a></h3>
                        <p class="location"><span class="fa fa-map-marker"></span> {{ $item->nama_pasar }}, {{ $item->subdis_name }}</p>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>

    <div class="row mt-5">
        <div class="col text-center">
            <div class="block-27">
                <ul id="paginationContainer">
                    {{-- Pagination akan dimasukkan melalui JavaScript --}}
                </ul>
            </div>
        </div>
    </div>


</section>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        document.getElementById('filterPasar').addEventListener('change', function() {
            let selectedPasar = this.value;
            let container = document.getElementById('hargaContainer');
            // container.innerHTML = '<p>Loading...</p>';

            fetch(`/get-harga-komoditas/${encodeURIComponent(selectedPasar)}?timestamp=${Date.now()}`)
                .then(response => response.json())
                .then(responseData => {
                    container.innerHTML = '';

                    let hargaArray = responseData.data;

                    if (!Array.isArray(hargaArray) || hargaArray.length === 0) {
                        container.innerHTML = '<p>Tidak ada data harga.</p>';
                        return;
                    }

                    hargaArray.forEach(item => {
                        let div = document.createElement('div');
                        div.classList.add('col-md-4'); // Tambahkan kembali class animasi
                        div.setAttribute('data-pasar', item.nama_pasar);

                        const formatter = new Intl.NumberFormat('id-ID', {
                            style: 'currency',
                            currency: 'IDR',
                            minimumFractionDigits: 0
                        });

                        div.innerHTML = `
                                  <div class="project-wrap">
                                    <a href="#" class="img" style="background-image: url('/assets/images/${item.gambar}');">
                                      <span class="price">${formatter.format(item.harga)}/kg</span>
                                    </a>
                                    <div class="text p-4">
                                      <h3><a href="#">${item.nama_komoditas}</a></h3>
                                      <p class="location"><span class="fa fa-map-marker"></span> ${item.nama_pasar}, ${item.subdis_name}</p>
                                    </div>
                                  </div>
                                `;

                        container.appendChild(div);
                    });

                    // 🔥 **Re-trigger animasi setelah elemen ditambahkan**
                    setTimeout(() => {
                        AOS.init(); // Jika menggunakan AOS
                    }, 50);
                })
                .catch(err => {
                    container.innerHTML = '<p>Error loading data.</p>';
                    console.error(err);
                });
        });
    });

    function generatePagination(pagination) {
        let paginationContainer = document.getElementById("paginationContainer");
        paginationContainer.innerHTML = "";

        if (pagination.last_page <= 1) return; // Tidak perlu pagination jika hanya 1 halaman

        let prevPage = pagination.current_page > 1 ? pagination.current_page - 1 : 1;
        let nextPage = pagination.current_page < pagination.last_page ? pagination.current_page + 1 : pagination.last_page;

        paginationContainer.innerHTML += `<li><a href="#" data-page="${prevPage}">&lt;</a></li>`;

        for (let i = 1; i <= pagination.last_page; i++) {
            paginationContainer.innerHTML += `
            <li class="${i === pagination.current_page ? 'active' : ''}">
                <a href="#" data-page="${i}">${i}</a>
            </li>
        `;
        }

        paginationContainer.innerHTML += `<li><a href="#" data-page="${nextPage}">&gt;</a></li>`;

        // **Tambahkan Event Listener ke Semua Tombol Pagination**
        document.querySelectorAll("#paginationContainer a").forEach(link => {
            link.addEventListener("click", function(event) {
                event.preventDefault(); // 🔥 Mencegah reload
                let page = this.getAttribute("data-page");
                let selectedPasar = document.getElementById('filterPasar').value;
                fetchHarga(`/get-harga-komoditas/${encodeURIComponent(selectedPasar)}?page=${page}`);
            });
        });
    }

    function fetchHarga(url) {
        let container = document.getElementById("hargaContainer");
        // container.innerHTML = '<p>Loading...</p>';

        fetch(url + '&timestamp=' + Date.now())
            .then(response => response.json())
            .then(responseData => {
                container.innerHTML = '';

                let hargaArray = responseData.data;

                if (!Array.isArray(hargaArray) || hargaArray.length === 0) {
                    container.innerHTML = '<p>Tidak ada data harga.</p>';
                    return;
                }

                hargaArray.forEach(item => {
                    let div = document.createElement('div');
                    div.classList.add('col-md-4');
                    div.setAttribute('data-pasar', item.nama_pasar);

                    div.innerHTML = `
                    <div class="project-wrap">
                                    <a href="#" class="img" style="background-image: url('/assets/images/${item.gambar}');">
                                      <span class="price">${formatter.format(item.harga)}/kg</span>
                                    </a>
                                    <div class="text p-4">
                                      <h3><a href="#">${item.nama_komoditas}</a></h3>
                                      <p class="location"><span class="fa fa-map-marker"></span> ${item.nama_pasar}, ${item.subdis_name}</p>
                                    </div>
                                  </div>
            `;

                    container.appendChild(div);
                });

                // 🔥 **Perbarui pagination setelah data dimuat**
                generatePagination(responseData);
            })
            .catch(err => {
                container.innerHTML = '<p>Error loading data.</p>';
                console.error(err);
            });
    }
</script>
@endsection