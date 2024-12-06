import 'package:dio/dio.dart';
import 'package:series_battle/models/seriesModel.dart';

class SeriesServices {
  final Dio _dio = Dio();

  Future<List<SeriesModel>> fetchSeriesAPI() async {
    try {
      final response = await _dio.get(
        'https://api.themoviedb.org/3/tv/top_rated',
        queryParameters: {
          'api_key': '22d8bf8a594425133da545f5638e7051',
          'language': 'pt-BR',
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> results = response.data['results'];
        return results.map((movie) => SeriesModel.fromJson(movie)).toList();
      } else {
        print('Resposta inesperada: ${response.statusCode}');
        throw Exception('Erro ao carregar filmes populares');
      }
    } catch (e) {
      print('Erro na requisição: $e');
      throw Exception('Erro na requisição: $e');
    }
  }
}