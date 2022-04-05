<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;;

class HatedPokemon extends Model
{
    use HasFactory;
    protected $table = "hatedpokemons";

    public function user(){
        return $this->belongsTo(User::class, 'user_id');
    }
}
