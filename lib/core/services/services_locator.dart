import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data_layer/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/data_layer/repository/movies_repository.dart';
import 'package:movie_app/movies/domain_layer/repository/base_movies_repository.dart';
import 'package:movie_app/movies/domain_layer/usecases/get_movie_details_usecase.dart';
import 'package:movie_app/movies/domain_layer/usecases/get_movie_recommendation_usecase.dart';
import 'package:movie_app/movies/domain_layer/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movies/domain_layer/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app/movies/domain_layer/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_app/movies/presentation_layer/controller/movie_details_bloc.dart';

import '../../movies/presentation_layer/controller/movies_bloc.dart';

 final sl = GetIt.instance;
class ServiceLocator{

 static void init(){
   //Bloc
   sl.registerFactory<MoviesBloc>(() => MoviesBloc(sl() , sl(), sl()));
   sl.registerFactory<MovieDetailsBloc>(() => MovieDetailsBloc(sl() , sl()));

   
    //Use cases
    sl.registerLazySingleton<GetNowPlayingMoviesUseCase>(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton<GetPopularMoviesUseCase>(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton<GetTopRatedMoviesUseCase>(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton<GetMovieDetailsUseCase>(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton<GetMovieRecommendationUseCase>(() => GetMovieRecommendationUseCase(sl()));

    /// Movies Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));

    ///DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  }


}