import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:series_battle/models/seriesModel.dart';
import 'package:series_battle/services/seriesServices.dart';
import 'package:series_battle/views/DetailSeriePage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final SeriesServices _seriesServices = SeriesServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red.shade800,
      ),
      body: Stack(
        children: [
          FutureBuilder<List<SeriesModel>>(
            future: _seriesServices.fetchSeriesAPI(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Erro ao carregar filmes: ${snapshot.error}'),
                );
              } else if (snapshot.hasData) {
                final series = snapshot.data!;
                return ListView.builder(
                  itemCount: series.length,
                  itemBuilder: (context, index) {
                    final serie = series[index];
                    return ListTile(
                      leading: Image.network(
                          'https://image.tmdb.org/t/p/w500/${serie.posterPath}'),
                      title: Text(serie.name),
                      subtitle: Text(
                        serie.overview,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        // Redireciona para a tela de detalhes
                        Get.to(DetailSerie(serie: serie));
                      },
                    );
                  },
                );
              } else {
                return Center(
                  child: Text('Nenhum filme encontrado!'),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

