import 'package:dartz/dartz.dart';
import 'package:movie_app/movies/domain_layer/entities/movie_details.dart';
import 'package:movie_app/movies/domain_layer/entities/recommendation.dart';
import 'package:movie_app/movies/domain_layer/usecases/get_movie_details_usecase.dart';
import 'package:movie_app/movies/domain_layer/usecases/get_movie_recommendation_usecase.dart';

import '../../../core/network/error/failure.dart';
import '../entities/movie_entities.dart';

abstract class BaseMoviesRepository{

  Future<Either<Failure, List<Movies>>>  getNowPlayingMovies(); //abstract method
  Future<Either<Failure, List<Movies>>>  getPopularMovies();
  Future<Either<Failure, List<Movies>>>  getTopRatedMovies();
  Future<Either<Failure, MovieDetails>>  getMovieDetails(MovieDetailsParameters parameters);
  Future<Either<Failure, List<Recommendation>>>  getMovieRecommendations(RecommendationParameters parameters);


}