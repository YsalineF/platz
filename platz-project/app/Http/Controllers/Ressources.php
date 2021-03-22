<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Ressource;

class Ressources extends Controller
{
    // Permet d'avoir toutes les Ressources sous la forme JSON
    public function index() {
      return response()->json(Ressource::all());
    }

    // Fonction qui permet d'ajouter une ressource à la db
    // On crée un nouvel objet de type Ressource et on le "remplit"
    // avec les éléments du formulaire rempli
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

    //Fonction qui permet d'éditer une ressource en modifiant les éléments de la db avec les nouveaux éléments
    // et qui permet le traitement d'une image afin que l'image en question se retrouve dans le dossier "assets/img"
    public function edit(Request $request) {
      $ressource = Ressource::find($request->id);
      $ressource->nom = $request->nom;

      if ($request->file('image')) {
        $image = $request->file('image');
        $imageRessource = $image->getClientOriginalName();
        $image->move(public_path('assets/img'), $imageRessource);
        $ressource->image = $imageRessource;
      }
      $ressource->description = $request->description;
      $ressource->categorie_id = $request->categorie;
      $ressource->user_id = $request->user;
      $ressource->updated_at = NOW();
      $ressource->save();
    }

    //Fonction qui permet de supprimer une ressource
    public function delete(Request $request) {
      $ressource = Ressource::find($request->id);
      $ressource->delete();
    }
}
