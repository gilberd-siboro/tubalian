@extends('layout.user.nav')
@section('content')


<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('images/cornfield.jpg');">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
            <div class="col-md-9 ftco-animate pb-5 text-center">
                <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Beranda <i class="fa fa-chevron-right"></i></a></span> <span>Komoditas Kecamatan<i class="fa fa-chevron-right"></i></span></p>
                <h1 class="mb-0 bread">Komoditas Kecamatan</h1>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section">
    <div class="container">
        <!-- Dropdown Filter Kecamatan -->
        <div class="row mb-4">
            <div class="col-md-4">
                <select id="filterKecamatan" class="form-control">
                    <option value="all">Semua Kecamatan</option>
                    @foreach ($kecamatan as $kec)
                    <option value="{{ $kec->dis_id }}">Kecamatan {{ $kec->dis_name }}</option>
                    @endforeach
                </select>
            </div>
        </div>


        <div class="row" id="komoditasContainer">
            @foreach ($komoditas as $item)
            <div class="col-md-4 ftco-animate" data-kecamatan="{{ $item->dis_name }}">
                <div class="project-wrap">
                    <a href="" class="img" style="background-image:url('{{ asset('assets/images/' . $item->gambar) }}');"></a>
                    <div class="text p-4">
                        <h3><a href="#">{{ $item->nama_komoditas }}</a></h3>
                        <p class="location"><span class="fa fa-map-marker"></span> {{ $item->subdis_name }}</p>
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
        document.getElementById('filterKecamatan').addEventListener('change', function() {
            let selectedKecamatan = this.value;
            let container = document.getElementById('komoditasContainer');
            // container.innerHTML = '<p>Loading...</p>';

            fetch(`/get-komoditas-kecamatan/${encodeURIComponent(selectedKecamatan)}?timestamp=${Date.now()}`)
                .then(response => response.json())
                .then(responseData => {
                    container.innerHTML = '';

                    let komoditasArray = responseData.data;

                    if (!Array.isArray(komoditasArray) || komoditasArray.length === 0) {
                        container.innerHTML = '<p>Tidak ada data komoditas.</p>';
                        return;
                    }

                    komoditasArray.forEach(item => {
                        let div = document.createElement('div');
                        div.classList.add('col-md-4'); // Tambahkan kembali class animasi
                        div.setAttribute('data-kecamatan', item.dis_name);

                        div.innerHTML = `
                        <div class="project-wrap">
                            <a href="#" class="img" style="background-image: url('/assets/images/${item.gambar}');"></a>
                            <div class="text p-4">
                                <h3><a href="#">${item.nama_komoditas}</a></h3>
                                <p class="location"><span class="fa fa-map-marker"></span> ${item.subdis_name}</p>
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
                let selectedKecamatan = document.getElementById('filterKecamatan').value;
                fetchKomoditas(`/get-komoditas-kecamatan/${encodeURIComponent(selectedKecamatan)}?page=${page}`);
            });
        });
    }

    function fetchKomoditas(url) {
        let container = document.getElementById("komoditasContainer");
        // container.innerHTML = '<p>Loading...</p>';

        fetch(url + '&timestamp=' + Date.now())
            .then(response => response.json())
            .then(responseData => {
                container.innerHTML = '';

                let komoditasArray = responseData.data;

                if (!Array.isArray(komoditasArray) || komoditasArray.length === 0) {
                    container.innerHTML = '<p>Tidak ada data komoditas.</p>';
                    return;
                }

                komoditasArray.forEach(item => {
                    let div = document.createElement('div');
                    div.classList.add('col-md-4');
                    div.setAttribute('data-kecamatan', item.dis_name);

                    div.innerHTML = `
                <div class="project-wrap">
                    <a href="#" class="img" style="background-image: url('/assets/images/${item.gambar}');"></a>
                    <div class="text p-4">
                        <h3><a href="#">${item.nama_komoditas}</a></h3>
                        <p class="location"><span class="fa fa-map-marker"></span> ${item.subdis_name}</p>
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


    document.getElementById('filterKecamatan').addEventListener('change', function() {
        let selectedKecamatan = this.value;
        fetchKomoditas(`/get-komoditas-kecamatan/${encodeURIComponent(selectedKecamatan)}?page=1`);
    });
</script>


@endsection