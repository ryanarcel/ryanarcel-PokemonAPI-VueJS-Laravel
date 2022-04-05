<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserDetails extends Model
{
    use HasFactory;
    protected $table = "userdetails";

    public function user(){
        return $this->belongsTo(User::class);
    }
}
