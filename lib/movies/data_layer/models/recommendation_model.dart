import 'package:movie_app/movies/domain_layer/entities/recommendation.dart';

class RecommendationModel extends Recommendation {

  const RecommendationModel({
    super.backdropPath,
    required super.id,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json){

    return RecommendationModel(
        backdropPath: json["backdrop_path"],
        id : json["id"],
    );
  }
}
