import 'package:dartz/dartz.dart';
import 'package:movie_app/core/base_usecase/base_usecase.dart';

import '../../../core/network/error/failure.dart';
import '../entities/movie_entities.dart';
import '../repository/base_movies_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movies>, NoParameters> {
  BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
