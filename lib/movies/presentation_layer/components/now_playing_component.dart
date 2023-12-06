import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/movies/presentation_layer/controller/movies_bloc.dart';
import 'package:movie_app/movies/presentation_layer/controller/movies_states.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/network/api_constants/api_constants.dart';
import '../screens/movie_detail_screen.dart';

//////////  Now Playing Movies List ////////
class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (previous, current) =>
          previous.nowPlayingState != current.nowPlayingState,
      builder: (context, state) {
        //print("BlocBuilder NowPlayingComponent");

        return FadeIn(
          duration: const Duration(milliseconds: 500),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 400.0,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {},
            ),
            items: state.nowPlayingMovies.map(
                  (item) {
                return GestureDetector(
                  key: const Key(AppStrings.nowPlayingKey),
                  onTap: () {
                    // Navigate to movie details screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailScreen(
                            id: item.id,
                          ),
                        ));
                  },
                  child: Stack(
                    children: [
                      ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              // fromLTRB
                              Colors.transparent,
                              Colors.grey,
                              Colors.grey,
                              Colors.transparent,
                            ],
                            stops: [0, 0.3, 0.5, 1],
                          ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          height: 560.0,
                          imageUrl: (item.backdropPath != null) ? ApiConstants.imageUrl(item.backdropPath!) : AppStrings.defaultNetworkImage,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            highlightColor: Colors.grey[800]!,
                            child: Container(
                              height: 560.0,
                              width: 200.0,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade700,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.redAccent,
                                    size: 16.0,
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    AppStrings.nowPlaying,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Text(
                                item.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
          ),
        );


      },
    );
  }
}
