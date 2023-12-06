class ApiConstants {

  //now playing  movies api url
  //https://api.themoviedb.org/3/movie/now_playing?api_key=3270f5f68c5aba14e3fb5424af230fdb
  //Movie image link
  //https://image.tmdb.org/t/p/w500/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg

  //Movie Details api url -- movie id needed
  //https://api.themoviedb.org/3/movie/507089?api_key=3270f5f68c5aba14e3fb5424af230fdb

  //Movie recommendation api url -- movie id needed
  //https://api.themoviedb.org/3/movie/507089/recommendations?api_key=3270f5f68c5aba14e3fb5424af230fdb

  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "3270f5f68c5aba14e3fb5424af230fdb";
  static const String nowPlayingMoviesPath = "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviesPath = "$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath = "$baseUrl/movie/top_rated?api_key=$apiKey";
  static const String baseMoviesImagesPath = "https://image.tmdb.org/t/p/w500";

  static String movieDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";

  static String movieRecommendationPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";


  static String imageUrl(String imagePath) {
    return '$baseMoviesImagesPath$imagePath';
  }

}

//weather
//https://openweathermap.org/current  the website
//api --> https://api.openweathermap.org/data/2.5/weather?q=egypt&appid=d803d06ed2d44be4f73a0346f031a589