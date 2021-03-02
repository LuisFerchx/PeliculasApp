

import 'package:peliculas/src/models/pelicula_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apikey = '577c3d9639c3fc12fa1176a08708170a';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  	
  //funcion que regresa un future que es un listado de peliculas 
  //devuelve los ites de las peliculas
  Future<List<Pelicula>>getEstrenos() async{

    //generar URL de una manera facil (dart)
    //reemplaza a la url entera para consumir la api
    //el sitio de la api, la ubicacion, los parametros
    final url = Uri.https(_url,'3/movie/now_playing',
    {
      'api_key' : _apikey,
      'language': _language
    });

    //aqui esta la respuesta del json pero en un string
    final resp = await http.get(url);

    //data decodificada - map
    final decodeData = json.decode(resp.body);

    //transformar el mapa a un objeto tipo peliculas
    final peliculas = new Peliculas.fromJsonList(decodeData['results']);

    return peliculas.items;

  }


}