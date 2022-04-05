<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\LikedPokemon;
use App\Models\HatedPokemon;
use Illuminate\Support\Facades\DB;

class PokemonController extends Controller
{
    /*public function index($user_id){
        $array = [];

        if($likedPokemons = LikedPokemon::findOrFail($user_id)->get()){
            array_push($array, $likedPokemons);
        }
        else{
            return [];
        }
        $hatedPokemons = HatedPokemon::findOrFail($user_id)->get();

        if(!$likedPokemons){
            array_push($array, [], $hatedPokemons);
        }
        if(!$hatedPokemons){
            array_push($array, $likedPokemons,[]);
        }
        if($likedPokemons && $hatedPokemons){
            array_push($array, $likedPokemons, $hatedPokemons);
        }
        return $array;
    }*/

    public function fetchLikedPokemons($user_id){
        return $pokemons = LikedPokemon::where('user_id', $user_id)->get();
    }

    public function fetchHatedPokemons($user_id){
        return $pokemons = HatedPokemon::where('user_id', $user_id)->get();
    }

    public function likePokemon(Request $request, $user_id, $poke_id){

        $likedPokemon = LikedPokemon::where([["user_id",  $user_id], ["pokemon_id", $poke_id]])->get();
        $hatedPokemon = HatedPokemon::where([["user_id",  $user_id], ["pokemon_id", $poke_id]])->get();

        if($likedPokemon->count() > 0 ){
            return "Pokemon already liked.";
            //return $likedPokemon->count();
        }
        else{
            $pokemon= new LikedPokemon();

            $pokemon->pokemon_id = $request->pokemon['pokemon_id'];
            $pokemon->name = $request->pokemon['name'];
            $pokemon->user_id = $request->pokemon['user_id'];

            $pokemon->save();

            if($hatedPokemon->count() >0){
                $hatedPokemon->first()->delete();
            }

            return $pokemon;
        }

    }

    public function hatePokemon(Request $request,$user_id, $poke_id){

        $likedPokemon = LikedPokemon::where([["user_id",  $user_id], ["pokemon_id", $poke_id]])->get();
        $hatedPokemon = HatedPokemon::where([["user_id",  $user_id], ["pokemon_id", $poke_id]])->get();

        if($hatedPokemon->count() > 0 ){
            return "Pokemon already hated.";
            //return $likedPokemon->count();
        }
        else{
            $pokemon= new HatedPokemon();

            $pokemon->pokemon_id = $request->pokemon['pokemon_id'];
            $pokemon->name = $request->pokemon['name'];
            $pokemon->user_id = $request->pokemon['user_id'];

            $pokemon->save();

            if($likedPokemon->count() >0){
                $likedPokemon->first()->delete();
            }

            return $pokemon;
        }
    }

    public function checkIfLiked($poke_id){
        $likedPokemon = LikedPokemon::where("pokemon_id", $poke_id)->get();

        if($likedPokemon->count() > 0 ){
            return true;
        }

        return false;
    }

    public function checkIfHated($poke_id){
        $hatedPokemon = HatedPokemon::where("pokemon_id", $poke_id)->get();

        if($hatedPokemon->count() > 0 ){
            return true;
        }
        return false;
    }

}
