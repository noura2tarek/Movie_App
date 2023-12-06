import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constants/api_constants.dart';
import '../controller/movie_details_bloc.dart';
//////////  Recommendation Movies List ////////

class RecommendationList extends StatelessWidget {
  const RecommendationList({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              final recommendation = state.movieRecommendationList[index];
              return FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  child: CachedNetworkImage(
                    imageUrl: (recommendation.backdropPath == null)
                        ? AppStrings.defaultNetworkImage
                        : ApiConstants.imageUrl(recommendation.backdropPath!),
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey.shade700,
                      highlightColor: Colors.grey.shade600,
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
                    const Icon(Icons.error),
                    height: 180.0,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            childCount: state.movieRecommendationList.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.7,
            crossAxisCount: 3,
          ),
        );
      },
    );
  }
}
