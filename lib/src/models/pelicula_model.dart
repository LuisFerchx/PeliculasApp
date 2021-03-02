//api key 577c3d9639c3fc12fa1176a08708170a
//solicitud example https://api.themoviedb.org/3/movie/550?api_key=577c3d9639c3fc12fa1176a08708170a
//token eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1NzdjM2Q5NjM5YzNmYzEyZmExMTc2YTA4NzA4MTcwYSIsInN1YiI6IjYwMzQ4MzdhNjA5NzUwMDAzZmMxNGY1ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HThwZgH8-lQB23155tlW7tf7UtMeZ0YGVq9QYenP8VU
class Peliculas {
  //contenedor de peliculas
  List<Pelicula> items = new List();

  Peliculas();

  //constructor de peliculas a items
  //recibira el json mapeado
  Peliculas.fromJsonList(List<dynamic> jsonList) {
    //recibe un jsonList, que es una lista de las peliculas
    if (jsonList == null) return; // si es nulo pues no hace nada
    /*
      si tiene valor, cada item dentro de la lista de peliculas
      se va a generar un final pelicula en donde se guarda esa pelicula
      para luego ser agregada a la List<Peliculas>
      haciendo que items, tenga una lista de todas las peliculas que vienen del JSON
    */
    for (var item in jsonList) {
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}

class Pelicula {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath; //poster de la peliucla
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  Pelicula({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  Pelicula.fromJsonMap(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'] / 1;
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'] / 1;
    voteCount = json['vote_count'];
  }

  getPosterImg(){

    if(posterPath.isEmpty){
      return 'https://www.pharmalookup.com/images/noresult.gif';
    }else{
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }

    
  }

}

