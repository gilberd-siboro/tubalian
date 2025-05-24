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
            @foreach ($persebaran as $item)
            <div class="col-md-4 ftco-animate" data-komoditas="{{ $item->nama_komoditas }}">
                <div class="project-wrap">
                    <a href="" class="img" style="background-image:url('{{ asset('assets/images/' . $item->gambar) }}');"></a>
                    <div class="text p-4">
                        <h3><a href="#">{{ $item->nama_komoditas }}</a></h3>
                        <p class="location"><span class="fa fa-map-marker"></span> {{ $item->subdis_name }},{{ $item->dis_name }}</p>
                    </div>
                </div>
            </div>
            @endforeach
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
    document.getElementById('searchKomoditas').addEventListener('input', function() {
        let filter = this.value.toLowerCase();
        let dropdown = document.getElementById('filterKomoditas');
        let options = dropdown.getElementsByTagName('option');

        for (let i = 0; i < options.length; i++) {
            let text = options[i].textContent.toLowerCase();
            if (text.includes(filter) || options[i].value === "all") {
                options[i].style.display = "block";
            } else {
                options[i].style.display = "none";
            }
        }
    });

    document.getElementById('filterKomoditas').addEventListener('change', function() {
        let selectedKomoditas = this.value;
        let items = document.querySelectorAll('#komoditasContainer .col-md-4');

        items.forEach(item => {
            if (selectedKomoditas === "all" || item.getAttribute('data-komoditas') === selectedKomoditas) {
                item.style.display = "block";
            } else {
                item.style.display = "none";
            }
        });
    });

    document.addEventListener("DOMContentLoaded", function() {
        document.getElementById('filterKomoditas').addEventListener('change', function() {
            let selectedKomoditas = this.value;
            let container = document.getElementById('persebaranContainer');
            // container.innerHTML = '<p>Loading...</p>';

            fetch(`/get-persebaran-komoditas/${encodeURIComponent(selectedKomoditas)}?timestamp=${Date.now()}`)
                .then(response => response.json())
                .then(responseData => {
                    container.innerHTML = '';

                    let persebaranArray = responseData.data;

                    if (!Array.isArray(persebaranArray) || persebaranArray.length === 0) {
                        container.innerHTML = '<p>Tidak ada data.</p>';
                        return;
                    }

                    persebaranArray.forEach(item => {
                        let div = document.createElement('div');
                        div.classList.add('col-md-4'); // Tambahkan kembali class animasi
                        div.setAttribute('data-komoditas', item.nama_komoditas);

                        div.innerHTML = `
                        <div class="project-wrap">
                            <a href="#" class="img" style="background-image: url('/assets/images/${item.gambar}');"></a>
                            <div class="text p-4">
                                <h3><a href="#">${item.nama_komoditas}</a></h3>
                                <p class="location"><span class="fa fa-map-marker"></span> ${item.subdis_name}, ${item.dis_name}</p>
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
                let selectedKomoditas = document.getElementById('filterKomoditas').value;
                fetchPersebaran(`/get-persebaran-komoditas/${encodeURIComponent(selectedKomoditas)}?page=${page}`);
            });
        });
    }

    function fetchPersebaran(url) {
        let container = document.getElementById("persebaranContainer");
        // container.innerHTML = '<p>Loading...</p>';

        fetch(url + '&timestamp=' + Date.now())
            .then(response => response.json())
            .then(responseData => {
                container.innerHTML = '';

                let persebaranArray = responseData.data;

                if (!Array.isArray(persebaranArray) || persebaranArray.length === 0) {
                    container.innerHTML = '<p>Tidak ada data.</p>';
                    return;
                }

                persebaranArray.forEach(item => {
                    let div = document.createElement('div');
                    div.classList.add('col-md-4');
                    div.setAttribute('data-komoditas', item.nama_komoditas);

                    div.innerHTML = `
                <div class="project-wrap">
                    <a href="#" class="img" style="background-image: url('/assets/images/${item.gambar}');"></a>
                    <div class="text p-4">
                        <h3><a href="#">${item.nama_komoditas}</a></h3>
                        <p class="location"><span class="fa fa-map-marker"></span> ${item.subdis_name}, ${item.dis_name}</p>
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


    document.getElementById('filterKomoditas').addEventListener('change', function() {
        let selectedKomoditas = this.value;
        fetchPersebaran(`/get-persebaran-komoditas/${encodeURIComponent(selectedKomoditas)}?page=1`);
    });
</script>

@endsection