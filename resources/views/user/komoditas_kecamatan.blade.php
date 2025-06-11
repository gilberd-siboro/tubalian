@extends('layout.user.nav')
@section('content')


<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('images/cornfield3.jpg');">
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

        </div>
    </div>

    <div class="row mt-5 mb-5">
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
        const filterDropdown = document.getElementById('filterKecamatan');
        const container = document.getElementById("komoditasContainer");

        function fetchKomoditas(url) {
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
                        div.className = 'col-md-3';
                        div.setAttribute('data-kecamatan', item.dis_name);
                        div.innerHTML = `
                            <div class="project-wrap">
                                <a href="#" class="img" style="background-image: url('/assets/images/${item.gambar}'); pointer-events: none;"></a>
                                <div class="text p-4">
                                    <h3><a style="pointer-events: none;" href="#">${item.nama_komoditas}</a></h3>
                                    <p class="location"><span class="fa fa-map-marker"></span> ${item.subdis_name}</p>
                                </div>
                            </div>
                        `;
                        container.appendChild(div);
                    });

                    generatePagination(responseData);
                    setTimeout(() => AOS.init(), 50); // Jika pakai animasi AOS
                })
                .catch(err => {
                    container.innerHTML = '<p>Error loading data.</p>';
                    console.error(err);
                });
        }

        function generatePagination(pagination) {
            const paginationContainer = document.getElementById("paginationContainer");
            paginationContainer.innerHTML = "";

            if (pagination.last_page <= 1) return;

            const prevPage = pagination.current_page > 1 ? pagination.current_page - 1 : 1;
            const nextPage = pagination.current_page < pagination.last_page ? pagination.current_page + 1 : pagination.last_page;

            paginationContainer.innerHTML += `<li><a href="#" data-page="${prevPage}">&lt;</a></li>`;

            for (let i = 1; i <= pagination.last_page; i++) {
                paginationContainer.innerHTML += `
                    <li class="${i === pagination.current_page ? 'active' : ''}">
                        <a href="#" data-page="${i}">${i}</a>
                    </li>
                `;
            }

            paginationContainer.innerHTML += `<li><a href="#" data-page="${nextPage}">&gt;</a></li>`;

            document.querySelectorAll('#paginationContainer a').forEach(link => {
                link.addEventListener('click', function(e) {
                    e.preventDefault();
                    const selectedPage = this.getAttribute('data-page');
                    const selectedId = filterDropdown.value;
                    fetchKomoditas(`/get-komoditas-kecamatan/${encodeURIComponent(selectedId)}?page=${selectedPage}`);
                });
            });
        }

        // Listener dropdown
        filterDropdown.addEventListener('change', function() {
            const selectedId = this.value;
            fetchKomoditas(`/get-komoditas-kecamatan/${encodeURIComponent(selectedId)}?page=1`);
        });

        // Initial auto-load
        fetchKomoditas(`/get-komoditas-kecamatan/all?page=1`);
    });
</script>



@endsection