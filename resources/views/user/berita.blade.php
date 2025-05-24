@extends('layout.user.nav')
@section('content')

<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('images/berita.jpg');">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
            <div class="col-md-9 ftco-animate pb-5 text-center">
                <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Beranda <i class="fa fa-chevron-right"></i></a></span> <span>Berita<i class="fa fa-chevron-right"></i></span></p>
                <h1 class="mb-0 bread">Berita</h1>
            </div>
        </div>
    </div>
</section>


<section class="ftco-section">
    <div class="container">
        <div class="row">
            @foreach($berita as $news)
            <div class="news-card">
                <img src="{{ asset('assets/images/' . $news->foto) }}" class="news-image" alt="Berita 1">
                <div class="news-content">
                    <div class="news-title">{{ $news -> judul }}</div>
                    <div class="divider"></div>
                    <div class="news-text">{{ \Illuminate\Support\Str::limit($news->deskripsi, 200, '...') }}</div>
                    <a href="{{ route('berita.isi', $news->idBerita) }}" class="news-link">Baca Selengkapnya →</a>
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
    // Fungsi untuk mendeteksi saat card masuk ke viewport
    function revealOnScroll() {
        const cards = document.querySelectorAll('.news-card');
        const windowHeight = window.innerHeight;

        cards.forEach(card => {
            const cardTop = card.getBoundingClientRect().top;

            if (cardTop < windowHeight - 100) {
                card.classList.add('show');
            }
        });
    }

    // Jalankan saat scroll dan saat pertama kali load
    window.addEventListener('scroll', revealOnScroll);
    window.addEventListener('load', revealOnScroll);

    document.addEventListener("DOMContentLoaded", function() {
        const paginationData = @json([
            'current_page' => $berita -> currentPage(),
            'last_page' => $berita -> lastPage()
        ]);

        generatePagination(paginationData);

        document.addEventListener('click', function(e) {
            if (e.target.matches('[data-page]')) {
                e.preventDefault();
                const page = e.target.getAttribute('data-page');
                window.location.href = `?page=${page}`;
            }
        });
    });

    function generatePagination(pagination) {
        let paginationContainer = document.getElementById("paginationContainer");
        paginationContainer.innerHTML = "";

        if (pagination.last_page <= 1) return;

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
    }
</script>
@endsection