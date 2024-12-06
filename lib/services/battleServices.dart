import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:series_battle/models/seriesModel.dart';

class BattleServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveBattleResult(SeriesModel winner) async {
    try {
      String userId = DateTime.now().millisecondsSinceEpoch.toString();

      DocumentReference userDoc = _firestore.collection('battle_results').doc(userId);

      DocumentSnapshot snapshot = await userDoc.get();

      if (snapshot.exists) {
        await userDoc.update({
          'wins': FieldValue.increment(1),
          'series_name': winner.name,
          'battle_date': FieldValue.serverTimestamp(),
        });
      } else {
        await userDoc.set({
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
