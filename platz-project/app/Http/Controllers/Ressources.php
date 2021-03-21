<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Ressource;

class Ressources extends Controller
{
    public function index() {
      return response()->json(Ressource::all());
    }

    public function add(Request $request) {
      $ressource = new Ressource;
      $ressource->nom = $request->nom;
      $ressource->description = $request->description;

      // Inspiration : projet laravel basica
      if($request->file('image')) {
        $image = $request->file('image');
        $imageRessource = $image->getClientOriginalName();
        $image->move(public_path('assets/img'), $imageRessource);
        $ressource->image = $imageRessource;
      }
      $ressource->size = $request->size;
      $ressource->categorie_id = $request->categorie;
      $ressource->user_id = $request->user;
      $ressource->save();

      return response()->json([
        'statut' => 200,
        'message' => "Ajout réussi"
      ]);
    }
}
