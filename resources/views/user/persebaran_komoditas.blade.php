@extends('layout.user.nav')
@section('content')
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('images/manggo.jpg');">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
            <div class="col-md-9 ftco-animate pb-5 text-center">
                <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Beranda <i class="fa fa-chevron-right"></i></a></span> <span>Persebaran Komoditas <i class="fa fa-chevron-right"></i></span></p>
                <h1 class="mb-0 bread">Persebaran Komoditas</h1>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section">
    <div class="container">

        <div class="row mb-4">
            <div class="col-md-4">
                <input type="text" id="searchKomoditas" class="form-control mb-2" placeholder="Cari Komoditas...">
                <select id="filterKomoditas" class="form-control">
                    <option value="all">Semua Komoditas</option>
                    @foreach ($komoditas as $kom)
                    <option value="{{ $kom->id_komoditas }}">{{ $kom->nama_komoditas }}</option>
                    @endforeach
                </select>
            </div>
        </div>

        <div class="row" id="persebaranContainer">
            {{-- Data Persebaran Komodiatas --}}
        </div>

        <div class="row mt-5 mb-5">
            <div class="col text-center">
                <div class="block-27">
                    <ul id="paginationContainer">
                        {{-- Pagination via JS --}}
                    </ul>
                </div>
            </div>
        </div>

    </div>
</section>

<script>
    document.getElementById('searchKomoditas').addEventListener('input', function() {
        let filter = this.value.toLowerCase();
        let dropdown = document.getElementById('filterKomoditas');
        let options = dropdown.getElementsByTagName('option');

        for (let i = 0; i < options.length; i++) {
            let text = options[i].textContent.toLowerCase();
            options[i].style.display = text.includes(filter) || options[i].value === "all" ? "block" : "none";
        }
    });


    function fetchPersebaran(url) {
        const container = document.getElementById("persebaranContainer");

        fetch(url + '&timestamp=' + Date.now())
            .then(res => res.json())
            .then(response => {
                const data = response.data;
                container.innerHTML = "";

                if (!Array.isArray(data) || data.length === 0) {
                    container.innerHTML = "<p>Tidak ada data.</p>";
                    return;
                }

                data.forEach(item => {
                    const div = document.createElement('div');
                    div.className = "col-md-4";
                    div.setAttribute('data-komoditas', item.nama_komoditas);

                    div.innerHTML = `
                    <div class="project-wrap">
                        <a href="#" class="img" style="background-image:url('/assets/images/${item.gambar}'); pointer-events: none;"></a>
                        <div class="text p-4">
                            <h3><a style="pointer-events: none;" href="#">${item.nama_komoditas}</a></h3>
                            <p class="location"><span class="fa fa-map-marker"></span> ${item.subdis_name}, ${item.dis_name}</p>
                        </div>
                    </div>
                `;

                    container.appendChild(div);
                });
                generatePagination(response);
            })
            .catch(err => {
                console.error(err);
                container.innerHTML = "<p>Error loading data.</p>";
            });
    }



    function generatePagination(pagination) {
        const container = document.getElementById("paginationContainer");
        container.innerHTML = "";

        if (pagination.last_page <= 1) return;

        const prevPage = pagination.current_page > 1 ? pagination.current_page - 1 : 1;
        const nextPage = pagination.current_page < pagination.last_page ? pagination.current_page + 1 : pagination.last_page;

        container.innerHTML += `<li><a href="#" data-page="${prevPage}">&lt;</a></li>`;

        for (let i = 1; i <= pagination.last_page; i++) {
            container.innerHTML += `
            <li class="${i === pagination.current_page ? 'active' : ''}">
                <a href="#" data-page="${i}">${i}</a>
            </li>
        `;
        }

        container.innerHTML += `<li><a href="#" data-page="${nextPage}">&gt;</a></li>`;

        document.querySelectorAll('#paginationContainer a').forEach(link => {
            link.addEventListener('click', function(e) {
                e.preventDefault();
                const selectedPage = this.getAttribute('data-page');
                const selectedId = document.getElementById("filterKomoditas").value;
                fetchPersebaran(`/get-persebaran-komoditas/${encodeURIComponent(selectedId)}?page=${selectedPage}`);
            });
        });
    }

    document.getElementById('filterKomoditas').addEventListener('change', function() {
        const selectedId = this.value;
        fetchPersebaran(`/get-persebaran-komoditas/${encodeURIComponent(selectedId)}?page=1`);
    });

    // Initial fetch on DOM load (optional if you want to auto-load first page of 'all')
    document.addEventListener('DOMContentLoaded', () => {
        fetchPersebaran(`/get-persebaran-komoditas/all?page=1`);
    });
</script>

@endsection