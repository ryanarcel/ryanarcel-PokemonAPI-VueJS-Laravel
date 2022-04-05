<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\UserDetailsController;
use App\Http\Controllers\PokemonController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('login', [AuthController::class, 'login']);
Route::post('register', [AuthController::class, 'register']);
Route::post('logout', [AuthController::class, 'logout']);

Route::get('/userdetails',[UserDetailsController::class, 'index']);
Route::prefix('/userdetail')->group(function(){
    Route::post('/store', [UserDetailsController::class, 'store']);
    Route::get('/{user_id}', [UserDetailsController::class, 'show']);
    Route::put('/{id}', [UserDetailsController::class, 'update']);
    Route::delete('/{id}', [UserDetailsController::class, 'destroy']);
});

Route::prefix('/pokemons')->group(function(){
    Route::get('/likes/{user_id}', [PokemonController::class, 'fetchLikedPokemons']);
    Route::get('/hates/{user_id}', [PokemonController::class, 'fetchHatedPokemons']);
    Route::post('/like/{user_id}/{poke_id}', [PokemonController::class, 'likePokemon']);
    Route::post('/hate/{user_id}/{poke_id}', [PokemonController::class, 'hatePokemon']);
    Route::get('/checkLike/{poke_id}', [PokemonController::class, 'checkIfLiked']);
    Route::get('/checkHate/{poke_id}', [PokemonController::class, 'checkIfHated']);
});

Route::get('/users',[UserController::class, 'fetchUsers']);
Route::prefix('/users')->group(function(){
    Route::get('/fetchLikes/{user_id}', [UserController::class, 'fetchLiked']);
    Route::get('/fetchHates/{user_id}', [UserController::class, 'fetchHated']);
});
