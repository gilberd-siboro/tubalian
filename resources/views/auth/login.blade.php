</html>

<!DOCTYPE html>
<html lang="en" class="light scroll-smooth group" data-layout="vertical" data-sidebar="light" data-sidebar-size="lg" data-mode="light" data-topbar="light" data-skin="default" data-navbar="sticky" data-content="fluid" dir="ltr">


<head>

    <meta charset="utf-8">
    <title>Sign In</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">

    <!-- App favicon -->
    <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('images/logo.png') }}">

    <!-- Layout config Js -->
    <script src="assets/js/layout.js"></script>
    <!-- Icons CSS -->

    <!-- StarCode CSS -->


    <link rel="stylesheet" href="assets/css/starcode2.css">
</head>

<body class="flex items-center justify-center min-h-screen py-16 lg:py-10 bg-slate-50 dark:bg-zink-800 dark:text-zink-100 font-public">

    <div class="relative">
        <div class="mb-0 w-screen lg:mx-auto lg:w-[500px] card shadow-lg border-none shadow-slate-200 relative">
            <div class="!px-10 !py-12 card-body">
                <a href="#!">
                    <img src="images/logo-light.png" alt="" class="hidden h-6 mx-auto dark:block">
                    <img src="images/logo-dark.png" alt="" class="block h-6 mx-auto dark:hidden">
                </a>
                <div class="mt-8 text-center">
                    <h4 class="mb-1 text-custom-500 dark:text-custom-500">Selamat Datang\</h4>
                    <p class="text-slate-500 dark:text-zink-200">Masuk dan jelajahi data pertanian.</p>
                </div>

                <div class="my-auto">
                    <form action="/proses-login" method="POST" class="mt-10" id="signInForm">
                        @csrf
                        <div class="mb-3">
                            <label for="username" class="inline-block mb-2 text-base font-medium">Username</label>
                            <input type="text" id="username" name="username" class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200" placeholder="Masukkan Username" value="{{ old('username') }}">

                            @error('username')
                            <div class="text-red-500 text-sm mt-1">{{ $message }}</div>
                            @enderror

                        </div>
                        <div class="mb-3">
                            <label for="password" class="inline-block mb-2 text-base font-medium">Password</label>
                            <input type="password" id="password" name="password" class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200" placeholder="Masukkan Password">

                            @error('password')
                            <div class="text-red-500 text-sm mt-1">{{ $message }}</div>
                            @enderror

                        </div>

                        @if ($errors->has('login_gagal'))
                        <div class="text-red-500 text-sm mt-1">{{ $errors->first('login_gagal') }}</div>
                        @endif

                        <div class="mt-10">
                            <button type="submit" class="w-full text-white btn bg-custom-500 border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100 dark:ring-custom-400/20">Sign
                                In</button>
                        </div>
                    </form>
                </div>
                <div class="mt-5">
                    <p class="mb-0 text-center text-15 text-slate-500 dark:text-zink-200">
                        Kembali ke halaman <a href="/" class="underline transition-all duration-200 ease-linear text-slate-800 dark:text-zink-50 hover:text-custom-500">Beranda</a>
                    </p>
                </div>
            </div>
        </div>

    </div>

    <script src='assets/libs/choices.js/public/assets/scripts/choices.min.js'></script>
    <script src="assets/libs/%40popperjs/core/umd/popper.min.js"></script>
    <script src="assets/libs/tippy.js/tippy-bundle.umd.min.js"></script>
    <script src="assets/libs/simplebar/simplebar.min.js"></script>
    <script src="assets/libs/prismjs/prism.js"></script>
    <script src="assets/libs/lucide/umd/lucide.js"></script>
    <script src="assets/js/starcode.bundle.js"></script>
    @include('sweetalert::alert')
</body>

</html>