<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Commentaire;

class Commentaires extends Controller
{
  public function index(){
    //return response()->json(Commentaire::all());
    return response()->json(Commentaire::with('ressource')->with('user')->get());
  }
}
