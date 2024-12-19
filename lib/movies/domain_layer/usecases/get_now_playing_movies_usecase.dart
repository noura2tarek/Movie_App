import 'package:dartz/dartz.dart';
import 'package:movie_app/core/base_usecase/base_usecase.dart';
import 'package:movie_app/movies/domain_layer/entities/movie_entities.dart';
import 'package:movie_app/movies/domain_layer/repository/base_movies_repository.dart';

import '../../../core/network/error/failure.dart';

class GetNowPlayingMoviesUseCase
    extends BaseUseCase<List<Movies>, NoParameters> {
  BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
