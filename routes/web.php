<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('{any}', function () {
    return view('app');
})->where('any', '.*');

Route::get('/test', function () {
    $pword = "test123";
    $hashed = Hash::make($pword);
    echo $hashed;

    echo "<br>";
    echo "session: ".session('key');
})->name("test");

Route::get('/', function () {
    return view('app', ['auth_user' => 'Ryan']);
})->name('front');




// Route::get('/login', function () {
//     return $redirect()->route('front');
// })->name('login');



