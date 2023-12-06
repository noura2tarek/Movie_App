import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/presentation_layer/controller/movies_bloc.dart';
import 'package:movie_app/movies/presentation_layer/controller/movies_states.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/network/api_constants/api_constants.dart';
import '../screens/movie_detail_screen.dart';
//////////  Popular Movies List ////////
class PopularComponent extends StatelessWidget {
  const PopularComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (previous, current) => previous.popularState != current.popularState,
      builder: (context, state) {
        switch(state.popularState){

          case RequestState.isLoading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.isLoaded:
          return FadeIn(
            duration: const Duration(microseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.popularMovies.length,
                itemBuilder: (context, index) {
                  final movie = state.popularMovies[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        // Navigate to movie details screen
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailScreen(
                                id: movie.id,
                              ),
                            ));
                      },
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl: movie.backdropPath != null ? ApiConstants.imageUrl(movie.backdropPath!) : AppStrings.defaultNetworkImage,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey.shade700, //850
                            highlightColor: Colors.grey.shade600, //800
                            child: Container(
                              height: 170.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Colors.grey[700],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error, color: Colors.grey,),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
          case RequestState.error:
            return Center(
              child: Text(state.popularErrorMessage),
            );
        }

      },

    );
  }
}
