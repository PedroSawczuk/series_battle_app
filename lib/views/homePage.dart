import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:series_battle/components/drawerCustom.dart';
import 'package:series_battle/controllers/seriesController.dart';
import 'package:series_battle/models/seriesModel.dart';
import 'package:series_battle/services/pdfServices.dart';
import 'package:series_battle/services/seriesServices.dart';
import 'package:series_battle/views/comparisonPage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final SeriesServices _seriesServices = SeriesServices();
  final SeriesController _seriesController = Get.put(SeriesController());
  final PdfServices _pdfServices = PdfServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerCustom(),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.picture_as_pdf),
            onPressed: () {
              _pdfServices.generateRankingPdf();
            },
          ),
        ],
        title: Text(
          'Series App',
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
                    final isSelected =
                        _seriesController.selectedSeries.contains(serie);

                    return ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      leading: Image.network(
                          'https://image.tmdb.org/t/p/w500/${serie.posterPath}'),
                      title: Text(serie.name),
                      subtitle: Text(
                        serie.overview,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      tileColor: isSelected
                          ? Colors.blue.shade100
                          : null,
                      shape: RoundedRectangleBorder(
                        side: isSelected
                            ? BorderSide(
                                color: Colors.blue,
                                width: 2)
                            : BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      onTap: () {
                        _seriesController.toggleSelectedSerie(serie);

                        // Mostrar o Snackbar com a série selecionada ou removida
                        String message = isSelected
                            ? 'Série ${serie.name} removida da seleção'
                            : 'Série ${serie.name} adicionada à seleção';
                        Get.snackbar(
                          'Seleção de Série',
                          message,
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.black.withOpacity(0.7),
                          colorText: Colors.white,
                          duration: Duration(seconds: 2),
                        );
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
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton.icon(
              onPressed: () {
                final selectedSeries = _seriesController.selectedSeries;
                if (selectedSeries.length == 2) {
                  Get.to(() => ComparisonPage(
                      series1: selectedSeries[0], series2: selectedSeries[1]));
                } else {
                  Get.snackbar('Seleção Incompleta',
                      'Por favor, selecione duas séries para comparar.');
                }
              },
              icon: Icon(
                Icons.compare_arrows,
                color: Colors.white,
                size: 20,
              ),
              label: Text(
                'Comparar',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade800,
                padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                shadowColor: Colors.black.withOpacity(0.3),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
