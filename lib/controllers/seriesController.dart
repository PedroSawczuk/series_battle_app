import 'package:get/get.dart';
import 'package:series_battle/models/seriesModel.dart';

class SeriesController extends GetxController {
  var selectedSeries = <SeriesModel>[];

  var isComparing = false.obs;

  // Método para adicionar ou remover uma série da seleção
  void toggleSelectedSerie(SeriesModel serie) {
    if (selectedSeries.contains(serie)) {
      selectedSeries.remove(serie);
    } else {
      if (selectedSeries.length < 2) {
        selectedSeries.add(serie);
      }
    }
    update(); // Atualiza o estado para refletir as mudanças
  }

  // Método para alternar entre o modo de comparação e o modo normal
  void toggleComparingMode() {
    isComparing.value = !isComparing.value;
    update(); // Atualiza o estado
  }

  // Método para limpar a seleção de séries (apenas se o usuário quiser)
  void clearSelectedSeries() {
    selectedSeries.clear();
    update();
  }
}
