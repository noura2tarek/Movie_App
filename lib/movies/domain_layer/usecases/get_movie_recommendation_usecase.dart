import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/base_usecase/base_usecase.dart';
import 'package:movie_app/core/network/error/failure.dart';
import 'package:movie_app/movies/domain_layer/entities/recommendation.dart';
import 'package:movie_app/movies/domain_layer/repository/base_movies_repository.dart';

class GetMovieRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {

  BaseMoviesRepository baseMoviesRepository;

  GetMovieRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) async {
    return await baseMoviesRepository.getMovieRecommendations(parameters);
  }

}

class RecommendationParameters extends Equatable {
  final int movieId;

  const RecommendationParameters({required this.movieId});
  @override
  List<Object> get props => [movieId];
}