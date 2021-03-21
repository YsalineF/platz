<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Categories;
use App\Http\Controllers\Ressources;
use App\Http\Controllers\Users;
use App\Http\Controllers\Commentaires;
use App\Http\Controllers\AuthenticationController;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

// API des Categories
// CTRL: Categories
Route::resource('categories', Categories::class)->except(['show', 'create', 'edit']);

// API des Ressources
// CTRL: Ressources
Route::resource('ressources', Ressources::class)->except(['show', 'create', 'edit']);

// API des Users
// CTRL: Users
Route::resource('users', Users::class)->except(['show', 'create', 'edit']);

// API des Commentaires
// CTRL: Commentaires
Route::resource('commentaires', Commentaires::class)->except(['show', 'create', 'edit']);

// Creation compte user
Route::post('/auth/register', [AuthenticationController::class, 'register']);

// Connexion compte user
Route::post('/auth/login', [AuthenticationController::class, 'login']);

// Deconnexion compte user
// Utilisation du middleware pour proteger la route et la rendre accessible uniquement aux users connectes
Route::group(['middleware' => ['auth:sanctum']], function() {
  Route::post('/logout', [AuthenticationController::class, 'logout']);
});
