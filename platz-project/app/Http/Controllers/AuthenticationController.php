<?php

// Inspiration : https://medium.com/swlh/api-authentication-using-laravel-sanctum-laravel-8-19ed8b4f124c

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class AuthenticationController extends Controller {

  // Fonction qui permet d'enregister un nouveau user
  public function register(Request $request) {
    // Tout d'abord, on valide la requête que le futur user a envoye
    $attr = $request->validate([
      'name' => 'required',
      'email' => 'required|email',
      'password' => 'required'
    ]);

    // Ensuite, on cree un nouveau user avec les infos rentrees par le user
    $user = User::create([
            'name' => $attr['name'],
            'password' => bcrypt($attr['password']),
            'email' => $attr['email']
            ]);

    return response()->json([
      'user'=>$user
    ]);

  }

  // Fonction qui permet au user de se connecter
  public function login(Request $request) {
    // Verifie les informations envoyees par le user
    $attr = $request->validate([
      'email' => 'required|email',
      'password' => 'required'
    ]);

    // Si la tentative est infructueuse
    if (!Auth::attempt($attr)) {
            return $this->error('Credentials not match', 401);
        }

     $user = User::where('email', $request->email)->first();

     return response()->json([
         'user' => $user
     ]);
  }

  // Fonction qui permet de se deconnecter en invalidant la session
  public function logout(Request $request) {
     $request->session()->invalidate();
  }

}
