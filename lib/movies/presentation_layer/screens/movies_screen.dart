import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/movies/presentation_layer/controller/movies_bloc.dart';
import 'package:movie_app/movies/presentation_layer/controller/movies_events.dart';
import '../../../core/services/services_locator.dart';
import '../components/now_playing_component.dart';
import '../components/popular_component.dart';
import '../components/top_rated_component.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())..add(GetPopularMoviesEvent())..add(
          GetTopRatedMoviesEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          key: const Key(AppStrings.movieScrollViewKey),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /////////// ****** Carousel Slider ******* ///////////////////
              const NowPlayingComponent(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.popular,
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        ///  NAVIGATION TO POPULAR SCREEN
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(AppStrings.seeMore,
                              style: TextStyle(color: Colors.white),),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              /////////// ****** Popular Movies List ******* ///////////////////
              const PopularComponent(),
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.topRated,
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// NAVIGATION TO Top Rated Movies Screen
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(AppStrings.seeMore,
                              style: TextStyle(color: Colors.white),),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              /////////// ****** Top Rated Movies List ******* ///////////
              const TopRatedComponent(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
