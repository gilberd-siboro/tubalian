<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Tests\TestCase;

class LoginControllerTest extends TestCase
{
    # [Test]

    protected function setUp(): void
    {
        parent::setUp();

        // Nonaktifkan semua middleware, termasuk VerifyCsrfToken
        $this->withoutMiddleware();
    }
    public function test_login_admin_berhasil()
    {
        // $this->withoutMiddleware(\App\Http\Middleware\VerifyCsrfToken::class);
        // Simulasikan Auth::attempt() mengembalikan true
        Auth::shouldReceive('attempt')
            ->once()
            ->andReturn(true);

        // Mock user login dan perannya
        $mockUser = (object) [
            'user_id' => 1,
            'roles' => (object)['role_name' => 'Admin'],
        ];
        Auth::shouldReceive('user')
            ->once()
            ->andReturn($mockUser);

        // Mock DB::table(...)->...->first() untuk ambil data user
        DB::shouldReceive('table')
            ->with('users')
            ->once()
            ->andReturnSelf();

        DB::shouldReceive('leftJoin')
            ->with('pegawai', 'users.personal_id', '=', 'pegawai.idPegawai')
            ->once()
            ->andReturnSelf();

        DB::shouldReceive('select')
            ->with('users.user_id', 'users.username', 'users.personal_id', 'pegawai.namaPegawai')
            ->once()
            ->andReturnSelf();

        DB::shouldReceive('where')
            ->with('users.user_id', 1)
            ->once()
            ->andReturnSelf();

        DB::shouldReceive('first')
            ->once()
            ->andReturn((object)[
                'user_id' => 1,
                'username' => 'admin',
                'personal_id' => 1,
                'namaPegawai' => 'Admin Nama'
            ]);

        $response = $this->post('/proses-login', [
            'username' => 'admin',
            'password' => 'admin123'
        ]);

        $response->assertRedirect(route('admin.dashboard'));
    }
    # [Test]
    public function test_login_gagal()
    {
        // $this->withoutMiddleware(\App\Http\Middleware\VerifyCsrfToken::class);
        Auth::shouldReceive('attempt')->once()->andReturn(false);

        $response = $this->post('/proses-login', [
            'username' => 'wronguser',
            'password' => 'salah123',
        ]);

        $response->assertRedirect('login');
        $response->assertSessionHasErrors(['login_gagal']);
    }
}
