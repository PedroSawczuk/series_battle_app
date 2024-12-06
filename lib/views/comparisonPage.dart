import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:series_battle/models/seriesModel.dart';
import 'package:series_battle/services/battleServices.dart';
import 'package:series_battle/controllers/seriesController.dart'; // Importando o SeriesController
import 'package:series_battle/views/homePage.dart';

class ComparisonPage extends StatelessWidget {
  final SeriesModel series1;
  final SeriesModel series2;

  ComparisonPage({Key? key, required this.series1, required this.series2}) : super(key: key);

  final BattleServices _battleServices = BattleServices();
  final SeriesController _seriesController = Get.find();  // Pegando o SeriesController já instanciado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comparação de Séries'),
        backgroundColor: Colors.red.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSerieCard(series1),
            SizedBox(height: 20),
            _buildSerieCard(series2),
            SizedBox(height: 20),
            Text(
              'Escolha a série vencedora:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await _battleServices.saveBattleResult(series1);
                    Get.snackbar('Série Vencedora', 'Você escolheu ${series1.name} como vencedora');
                    _seriesController.clearSelectedSeries();  // Limpa a seleção
                    Get.offAll(HomePage());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    series1.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _battleServices.saveBattleResult(series2);
                    Get.snackbar('Série Vencedora', 'Você escolheu ${series2.name} como vencedora');
                    _seriesController.clearSelectedSeries();  // Limpa a seleção
                    Get.offAll(HomePage());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade800,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    series2.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSerieCard(SeriesModel serie) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w500/${serie.posterPath}',
            width: 120,
            height: 180,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              serie.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              serie.overview,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Avaliação: ${serie.voteAverage.toStringAsFixed(1)}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
