import 'package:dartz/dartz.dart';
import 'package:movie_app/core/network/error/exceptions.dart';
import 'package:movie_app/core/network/error/failure.dart';
import 'package:movie_app/movies/data_layer/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/domain_layer/entities/movie_details.dart';
import 'package:movie_app/movies/domain_layer/entities/movie_entities.dart';
import 'package:movie_app/movies/domain_layer/entities/recommendation.dart';
import 'package:movie_app/movies/domain_layer/repository/base_movies_repository.dart';
import 'package:movie_app/movies/domain_layer/usecases/get_movie_details_usecase.dart';
import 'package:movie_app/movies/domain_layer/usecases/get_movie_recommendation_usecase.dart';

class MoviesRepository extends BaseMoviesRepository {
  BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  // make the concrete implementation of base repository methods by calling the methods in datasource
  @override
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getMovieRecommendations(
      RecommendationParameters parameters) async {
    final result =
        await baseMovieRemoteDataSource.getMovieRecommendation(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
