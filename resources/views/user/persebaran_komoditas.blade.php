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
                <select id="filterKomoditas" class="form-control mb-2">
                    <option value="all">-- Semua Komoditas --</option>
                    @foreach ($komoditas as $k)
                    <option value="{{ $k->id_komoditas }}">{{ $k->nama_komoditas }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-4">
                <select id="filterKecamatan" class="form-control mb-2">
                    <option value="all">-- Semua Kecamatan --</option>
                    @foreach ($kecamatan as $d)
                    <option value="{{ $d->dis_id }}">{{ $d->dis_name }}</option>
                    @endforeach
                </select>
            </div>
        </div>

        <div class="row" id="persebaranContainer">
            {{-- Data Persebaran Komoditas --}}
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

<!-- Modal -->
<div class="modal fade" id="komoditasModal" tabindex="-1" role="dialog" aria-labelledby="komoditasModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="komoditasModalLabel">Detail Persebaran Komoditas</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="font-size: 1.5rem;">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="modalGroupedData">
                    Loading data...
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function fetchPersebaran(page = 1) {
        const komoditasId = document.getElementById("filterKomoditas").value;
        const kecamatanId = document.getElementById("filterKecamatan").value;

        const url = `/get-persebaran-komoditas-filter?komoditas=${encodeURIComponent(komoditasId)}&kecamatan=${encodeURIComponent(kecamatanId)}&page=${page}&timestamp=${Date.now()}`;

        const container = document.getElementById("persebaranContainer");
        container.innerHTML = "<p>Memuat data...</p>";

        fetch(url)
            .then(res => res.json())
            .then(response => {
                const data = response.data;
                container.innerHTML = "";

                if (!Array.isArray(data) || data.length === 0) {
                    container.innerHTML = "<p>Tidak ada data yang ditemukan.</p>";
                    document.getElementById("paginationContainer").innerHTML = "";
                    return;
                }

                data.forEach(item => {
                    const div = document.createElement('div');
                    div.className = "col-md-3";

                    const imageUrl = (item.gambar?.split(',')[0] || "default.png").trim();
                    const lokasi = `${item.dis_name} - ${item.subdis_name}`;

                    div.innerHTML = `
    <div class="project-wrap">
        <a href="javascript:void(0);" class="img" style="background-image:url('/assets/images/${item.gambar}'); height: 200px !important;" onclick="openModal(${item.id_komoditas})">
        </a>
        <div class="text p-4">
            <h3 style="font-size: 18px">
                <a style="pointer-events: none;" href="#">${item.nama_komoditas}</a>
            </h3>
            <p class="location mb-1">
                <ul style="padding-left: 1rem;">
                    ${item.info_kecamatan ? `<li style="font-size: 14px;"><span class="flaticon-map"></span> ${item.info_kecamatan}</li>` : ''}
                    ${item.info_desa ? `<li style="font-size: 14px;"><span class="flaticon-route"></span> ${item.info_desa}</li>` : ''}
                </ul>
            </p>
        </div>
    </div>
`;
                    container.appendChild(div);
                });

                generatePagination(response.meta);
            })
            .catch(error => {
                container.innerHTML = "<p>Terjadi kesalahan saat mengambil data.</p>";
                console.error("Fetch error:", error);
            });
    }

    function openModal(komoditasId) {
        // Show modal
        $('#komoditasModal').modal('show');

        // Fetch detail from the server
        fetch(`/getDetailKomoditas?id_komoditas=${komoditasId}`)
            .then(res => res.json())
            .then(response => {
                const data = response.data;
                const modalGroupedData = document.getElementById('modalGroupedData');

                if (data && data.length > 0) {
                    // Group desa by kecamatan (dis_name)
                    const kecamatanMap = {};

                    data.forEach(item => {
                        if (!kecamatanMap[item.dis_name]) {
                            kecamatanMap[item.dis_name] = new Set();
                        }
                        kecamatanMap[item.dis_name].add(item.subdis_name);
                    });

                    // Build HTML for grouped kecamatan and desa
                    let html = '';

                    for (const kecamatan in kecamatanMap) {
                        html += `<p><strong>Kecamatan ${kecamatan}</strong></p><ul>`;
                        kecamatanMap[kecamatan].forEach(desa => {
                            html += `<li style="color: #000;" >Desa ${desa}</li>`;
                        });
                        html += `</ul>`;
                    }

                    modalGroupedData.innerHTML = html;
                } else {
                    modalGroupedData.textContent = "Data tidak ditemukan.";
                }
            })
            .catch(error => {
                console.error("Error fetching detail:", error);
                const modalGroupedData = document.getElementById('modalGroupedData');
                modalGroupedData.textContent = "Error loading data.";
            });
    }

    function generatePagination(meta) {
        const paginationContainer = document.getElementById("paginationContainer");
        if (!paginationContainer || !meta) return;

        const {
            current_page,
            last_page
        } = meta;
        let html = '<ul>';

        // Previous button
        if (current_page > 1) {
            html += `<li><a href="javascript:void(0);" onclick="fetchPersebaran(${current_page - 1})">&lt;</a></li>`;
        } else {
            html += `<li><span style="opacity: 0.5;">&lt;</span></li>`;
        }

        // Page numbers
        for (let i = 1; i <= last_page; i++) {
            if (i === current_page) {
                html += `<li class="active"><span>${i}</span></li>`;
            } else {
                html += `<li><a href="javascript:void(0);" onclick="fetchPersebaran(${i})">${i}</a></li>`;
            }
        }

        // Next button
        if (current_page < last_page) {
            html += `<li><a href="javascript:void(0);" onclick="fetchPersebaran(${current_page + 1})">&gt;</a></li>`;
        } else {
            html += `<li><span style="opacity: 0.5;">&gt;</span></li>`;
        }

        html += '</ul>';

        paginationContainer.innerHTML = html;
    }

    document.getElementById("filterKomoditas").addEventListener("change", () => fetchPersebaran(1));
    document.getElementById("filterKecamatan").addEventListener("change", () => fetchPersebaran(1));

    document.addEventListener('DOMContentLoaded', () => {
        fetchPersebaran();
    });
</script>

@endsection