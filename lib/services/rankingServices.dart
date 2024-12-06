import 'package:cloud_firestore/cloud_firestore.dart';

class RankingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getRanking() async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('battle_results')
          .orderBy('wins', descending: true)
          .get();

      List<Map<String, dynamic>> ranking = querySnapshot.docs.map((doc) {
        return {
          'series_name': doc['series_name'],
          'wins': doc['wins'],
        };
      }).toList();

      return ranking;
    } catch (e) {
      print("Erro ao obter o ranking: $e");
      return [];
    }
  }
}
