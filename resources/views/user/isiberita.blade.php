@extends('layout.user.nav')
@section('content')


<section class="ftco-section">
    <style>
        .news-article {
            max-width: 700px;
            margin: 0 auto;
        }

        .title {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .divider {
            border-bottom: 2px solid #8b8b8b;
            margin-bottom: 15px;
        }

        .meta {
            color: #777;
            font-size: 0.9rem;
            margin-bottom: 20px;
        }

        .featured-image {
            width: 100%;
            height: auto;
            margin-bottom: 20px;
            border-radius: 6px;
        }

        .content p {
            margin-bottom: 16px;
            text-align: justify;
        }

        /* .ftco-navbar-light.scrolled .navbar-brand {
            color: #000000 !important;
        } */
        @media (min-width: 992px) {
            .ftco-navbar-light .navbar-nav>.nav-item>.nav-link {
                color: #000 !important;
            }

            .ftco-navbar-light .navbar-brand {
                color: #000 !important;
            }
        }

        /* @media (max-width: 991.98px) {
            .ftco-navbar-light .navbar-nav>.nav-item>.nav-link {
                color: #fff !important;
            }
        } */

        /* @media (max-width: 991.98px) {
            .ftco-navbar-light .navbar-brand {
                color: #fff !important;
            }
        } */
    </style>

    <div class="container mb-4">
        <div class="row">
            <article class="news-article">
                <h1 class="title">{{ $berita->judul }}</h1>
                <p class="meta">{{ $berita->formatted_created_at }}</p>
                <div class="divider"></div>
                <img src="{{ asset('assets/images/' . $berita->foto) }}" alt="Petani di dalam rumah kaca" class="featured-image" />
                <div class="content">
                    <p>{!! nl2br(e($berita->deskripsi)) !!}</p>


                </div>
            </article>
        </div>

    </div>

</section>

@endsection