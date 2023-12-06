//movie entities
import 'package:equatable/equatable.dart';

class Movies extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String? backdropPath;
  final double voteAverage;
  final List<dynamic> genreIds;
  final String releaseDate;

  const Movies({
    required this.id,
    required this.title,
    required this.overview,
    this.backdropPath,
    required this.voteAverage,
    required this.genreIds,
    required this.releaseDate,
  });

// to check equatable entities or data
  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        backdropPath,
        voteAverage,
        genreIds,
        releaseDate,
      ];

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//       other is Movies &&
//           runtimeType == other.runtimeType &&
//           id == other.id &&
//           title == other.title &&
//           overview == other.overview &&
//           backdropPath == other.backdropPath &&
//           voteAverage == other.voteAverage &&
//           genreIds == other.genreIds;
//   }
//
//   @override
//   int get hashCode {
//     return id.hashCode ^
//       title.hashCode ^
//       overview.hashCode ^
//       backdropPath.hashCode ^
//       voteAverage.hashCode ^
//       genreIds.hashCode;
//   }
}
