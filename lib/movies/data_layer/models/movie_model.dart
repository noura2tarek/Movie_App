import 'package:movie_app/movies/domain_layer/entities/movie_entities.dart';

class MovieModel extends Movies {
  const MovieModel({
    required super.id,
    required super.title,
    required super.overview,
    super.backdropPath,
    required super.voteAverage,
    required super.genreIds,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json["id"],
      title: json["title"],
      overview: json["overview"],
      backdropPath: json["backdrop_path"],
      voteAverage: json["vote_average"].toDouble(),
      genreIds: json["genre_ids"],
      releaseDate: json["release_date"],
    );
  }
}
