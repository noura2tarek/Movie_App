import 'package:movie_app/movies/data_layer/models/genres_model.dart';
import '../../domain_layer/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    super.backdropPath,
    required super.genres,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runTime,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      backdropPath: json["backdrop_path"],
      genres: List<GenresModel>.from(json["genres"].map((e) => GenresModel.fromJson(e))),
      id: json["id"],
      overview: json["overview"],
      releaseDate: json["release_date"],
      runTime: json["runtime"],
      title: json["title"],
      voteAverage: json["vote_average"].toDouble(),



    );
  }
}
