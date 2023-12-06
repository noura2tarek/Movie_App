part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;

  GetMovieDetailsEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}

class GetMovieRecommendationEvent extends MovieDetailsEvent {
  final int movieId;

  GetMovieRecommendationEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}