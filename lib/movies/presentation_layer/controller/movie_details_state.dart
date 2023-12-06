part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieRecommendationList = const [],
    this.movieRecommendationState = RequestState.isLoading,
    this.movieRecommendationErrorMessage = '',
    this.movieDetails,
    this.movieDetailsState = RequestState.isLoading,
    this.movieDetailsErrorMessage = " ",
  });

  //the data of movie details we receive
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsErrorMessage;

  //the data of movie recommendation we receive
  final List<Recommendation> movieRecommendationList;
  final RequestState movieRecommendationState;
  final String movieRecommendationErrorMessage;

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsErrorMessage,
    List<Recommendation>? movieRecommendationList,
    RequestState? movieRecommendationState,
    String? movieRecommendationErrorMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsErrorMessage:
          movieDetailsErrorMessage ?? this.movieDetailsErrorMessage,
      movieRecommendationList:
          movieRecommendationList ?? this.movieRecommendationList,
      movieRecommendationState:
          movieRecommendationState ?? this.movieRecommendationState,
      movieRecommendationErrorMessage: movieRecommendationErrorMessage ??
          this.movieRecommendationErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsErrorMessage,
        movieRecommendationList,
        movieRecommendationState,
        movieRecommendationErrorMessage,
      ];
}
