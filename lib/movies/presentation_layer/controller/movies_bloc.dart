import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/base_usecase/base_usecase.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain_layer/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movies/domain_layer/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app/movies/domain_layer/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_app/movies/presentation_layer/controller/movies_events.dart';
import 'package:movie_app/movies/presentation_layer/controller/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesStates()) {

    /////// Now playing event
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    ////// popular event
    on<GetPopularMoviesEvent>(_getPopularMovies);
    ////// top rated event
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }





  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingMessage: l.message,
          nowPlayingState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.isLoaded,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesStates> emit) async {

    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
            (l) => emit(state.copyWith(
          popularMessage: l.message,
          popularState: RequestState.error,
        )),
            (r) => emit(state.copyWith(
          popularMovies: r,
          popularState: RequestState.isLoaded,
        )));
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesStates> emit) async{

    final result = await getTopRatedMoviesUseCase(const NoParameters());

    result.fold(
            (l) => emit(state.copyWith(
          topRatedMessage: l.message,
          topRatedState: RequestState.error,
        )),
            (r) => emit(state.copyWith(
          topRatedMovies: r,
          topRatedState: RequestState.isLoaded,
        )));

  }
}
