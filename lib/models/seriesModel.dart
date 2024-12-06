class SeriesModel {
  final int id;
  final String overview;
  final String posterPath;
  final String name;
  final double voteAverage;

  SeriesModel({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.name,
    required this.voteAverage,
  });

  factory SeriesModel.fromJson(Map<String, dynamic> json) {
    return SeriesModel(
      id: json['id'],
      posterPath: json['poster_path'],
      name: json['name'],
      overview: json['overview'],
      voteAverage: json['vote_average'],
    );
  }
}
