import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/network/api_constants/api_constants.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:shimmer/shimmer.dart';
import '../../domain_layer/entities/movie_entities.dart';
import '../controller/movies_bloc.dart';
import '../controller/movies_states.dart';
import 'movie_detail_screen.dart';

class MoreMoviesScreen extends StatelessWidget {
  final List<Movies> movies;
  final bool? isTopRated;

  const MoreMoviesScreen({
    super.key,
    required this.movies,
    this.isTopRated,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MoreMoviesContent(
        moviesC: movies,
        isTopRated: isTopRated ?? false,
      ),
    );
  }
}

//////////////////////////
class MoreMoviesContent extends StatelessWidget {
  const MoreMoviesContent({
    super.key,
    required this.moviesC,
    required this.isTopRated,
  });

  final List<Movies> moviesC;
  final bool isTopRated;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesStates>(
      builder: (context, state) {
        // Custom Scrolling using custom scroll view
        return CustomScrollView(
          key: const Key(AppStrings.movieScrollViewKey),
          scrollDirection: Axis.vertical,
          slivers: [
            // Silver AppBar
            SliverAppBar(
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              pinned: true,
              expandedHeight: 250.0,
              title: Text(isTopRated ? 'Top Rated Movies' : 'Popular Movies'),
            ),
            // Movies list using fade in animation using Silver padding
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
              sliver: FadeIn(
                duration: const Duration(milliseconds: 500),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: moviesC.length,
                  itemBuilder: (context, index) {
                    final movie = moviesC[index];
                    return Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
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
                            imageUrl: (movie.backdropPath != null)
                                ? ApiConstants.imageUrl(movie.backdropPath!)
                                : AppStrings.defaultNetworkImage,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
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
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
