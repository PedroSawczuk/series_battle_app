import 'package:flutter/material.dart';
import 'package:series_battle/models/seriesModel.dart';

class DetailSerie extends StatelessWidget {
  final SeriesModel serie;

  DetailSerie({Key? key, required this.serie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serie.name),
        backgroundColor: Colors.red.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
                'https://image.tmdb.org/t/p/w500/${serie.posterPath}'),
            SizedBox(height: 16),
            Text(
              serie.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              serie.overview,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
