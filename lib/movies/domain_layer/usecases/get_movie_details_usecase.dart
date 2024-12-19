import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/base_usecase/base_usecase.dart';
import 'package:movie_app/core/network/error/failure.dart';
import 'package:movie_app/movies/domain_layer/entities/movie_details.dart';
import 'package:movie_app/movies/domain_layer/repository/base_movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails, MovieDetailsParameters> {

  BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
