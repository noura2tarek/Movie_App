import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain_layer/entities/recommendation.dart';
import 'package:movie_app/movies/domain_layer/usecases/get_movie_recommendation_usecase.dart';

import '../../domain_layer/entities/movie_details.dart';
import '../../domain_layer/usecases/get_movie_details_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {

  MovieDetailsBloc(
    this.getMovieDetailsUseCase,
    this.getMovieRecommendationUseCase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    
    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
    
  }
  //reference object of usecases
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieRecommendationUseCase getMovieRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(
        MovieDetailsParameters(movieId: event.movieId));

    result.fold(
      (l) => emit(state.copyWith(
        movieDetailsState: RequestState.error,
        movieDetailsErrorMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        movieDetailsState: RequestState.isLoaded,
        movieDetails: r,
      )),
    );
  }

  FutureOr<void> _getMovieRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async{
    final result = await getMovieRecommendationUseCase(RecommendationParameters(movieId: event.movieId));

    result.fold(
          (l) => emit(state.copyWith(
        movieRecommendationState: RequestState.error,
        movieRecommendationErrorMessage: l.message,
      )),
          (r) => emit(state.copyWith(
        movieRecommendationState: RequestState.isLoaded,
        movieRecommendationList: r,
      )),
    );


  }
}
