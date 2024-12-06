import 'package:cloud_firestore/cloud_firestore.dart';

class SeriesBattleService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Registrar vitória de uma série
  Future<void> registerVictory(String serieId) async {
    try {
      var serieRef = _firestore.collection('series').doc(serieId);
      await _firestore.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(serieRef);
        if (!snapshot.exists) {
          throw Exception("Série não encontrada!");
        }

        int victories = snapshot['victories'] ?? 0;
        transaction.update(serieRef, {'victories': victories + 1});
      });
    } catch (e) {
      print('Erro ao registrar vitória: $e');
    }
  }

  // Obter as séries mais vitoriosas
  Future<List<Map<String, dynamic>>> getTopSeries() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('series')
          .orderBy('victories', descending: true)
          .limit(5)
          .get();

      return snapshot.docs
          .map((doc) => {
                'name': doc['name'],
                'victories': doc['victories'],
                'id': doc.id,
              })
          .toList();
    } catch (e) {
      print('Erro ao obter ranking: $e');
      return [];
    }
  }
}
