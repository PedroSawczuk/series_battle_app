import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:series_battle/models/seriesModel.dart';

class BattleServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveBattleResult(SeriesModel winner) async {
    try {
      // Usar o nome da série como o ID do documento
      DocumentReference seriesDoc = _firestore.collection('battle_results').doc(winner.name);

      DocumentSnapshot snapshot = await seriesDoc.get();

      if (snapshot.exists) {
        // Se a série já existir, incrementa o número de vitórias
        await seriesDoc.update({
          'wins': FieldValue.increment(1),
          'battle_date': FieldValue.serverTimestamp(),
        });
      } else {
        // Se a série não existir, cria um novo documento com a contagem inicial de vitórias
        await seriesDoc.set({
          'wins': 1,
          'series_name': winner.name,
          'battle_date': FieldValue.serverTimestamp(),
        });
      }
    } catch (e) {
      print("Erro ao salvar a batalha: $e");
    }
  }
}
