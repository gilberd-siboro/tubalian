<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{

    protected $table = 'user_roles';
    protected $primaryKey = 'role_id';
    
    public function users()
    {
        return $this->hasMany(User::class);
    }
}
