import 'package:flutter/material.dart';
import 'package:series_battle/components/drawerCustom.dart';
import 'package:series_battle/services/rankingServices.dart';

class RankingPage extends StatelessWidget {
  final RankingService _rankingService = RankingService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerCustom(),
      appBar: AppBar(
        title: Text("Ranking de Vitórias"),
        backgroundColor: Colors.red.shade800,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _rankingService.getRanking(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erro ao carregar o ranking"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Nenhum dado encontrado"));
          } else {
            var ranking = snapshot.data!;
            return ListView.builder(
              itemCount: ranking.length,
              itemBuilder: (context, index) {
                var entry = ranking[index];
                return ListTile(
                  title: Text(entry['series_name']),
                  trailing: Text("Vitórias: ${entry['wins']}"),
                );
              },
            );
          }
        },
      ),
    );
  }
}
