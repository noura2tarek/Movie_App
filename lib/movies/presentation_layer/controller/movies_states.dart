import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';

import '../../domain_layer/entities/movie_entities.dart';

class MoviesStates extends Equatable {
///// Now playing state
  final List<Movies> nowPlayingMovies;
  final String nowPlayingErrorMessage;
  final RequestState nowPlayingState;

  ///// Popular state
  final List<Movies> popularMovies;
  final String popularErrorMessage;
  final RequestState popularState;

///// Top Rated state
  final List<Movies> topRatedMovies;
  final String topRatedErrorMessage;
  final RequestState topRatedState;

  const MoviesStates({
    this.nowPlayingMovies = const [],
    this.nowPlayingErrorMessage = '',
    this.nowPlayingState = RequestState.isLoading,
    this.popularMovies = const [],
    this.popularErrorMessage = '',
    this.popularState = RequestState.isLoading,
    this.topRatedMovies = const [],
    this.topRatedErrorMessage = '',
    this.topRatedState = RequestState.isLoading,
  });

  MoviesStates copyWith({
    List<Movies>? nowPlayingMovies,
    String? nowPlayingMessage,
    RequestState? nowPlayingState,
    List<Movies>? popularMovies,
    String? popularMessage,
    RequestState? popularState,
    List<Movies>? topRatedMovies,
    String? topRatedMessage,
    RequestState? topRatedState,
  }) {
    return MoviesStates(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingErrorMessage: nowPlayingMessage ?? this.nowPlayingErrorMessage,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      popularMovies: popularMovies ?? this.popularMovies,
      popularErrorMessage: popularMessage ?? this.popularErrorMessage,
      popularState: popularState ?? this.popularState,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedErrorMessage: topRatedMessage ?? this.topRatedErrorMessage,
      topRatedState: topRatedState ?? this.topRatedState,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingErrorMessage,
        nowPlayingState,
        popularMovies,
        popularErrorMessage,
        popularState,
        topRatedMovies,
        topRatedErrorMessage,
        topRatedState
      ];
}
