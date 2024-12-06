import 'package:get/get.dart';
import 'package:series_battle/models/seriesModel.dart';

class SeriesController extends GetxController {
  // Lista para armazenar as séries selecionadas
  var selectedSeries = <SeriesModel>[];

  // Variável que controla o modo de comparação
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
    if (!isComparing.value) {
      selectedSeries.clear(); // Limpa a seleção quando o modo de comparação é desativado
    }
    update(); // Atualiza o estado
  }
}
