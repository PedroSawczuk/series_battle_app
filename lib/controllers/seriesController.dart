import 'package:get/get.dart';
import 'package:series_battle/models/seriesModel.dart';

class SeriesController extends GetxController {
  var selectedSeries = <SeriesModel>[];

  var isComparing = false.obs;

  void toggleSelectedSerie(SeriesModel serie) {
    if (selectedSeries.contains(serie)) {
      selectedSeries.remove(serie);
    } else {
      if (selectedSeries.length < 2) {
        selectedSeries.add(serie);
      }
    }
    update();
  }

  void toggleComparingMode() {
    isComparing.value = !isComparing.value;
    update();
  }

  void clearSelectedSeries() {
    selectedSeries.clear();
    update();
  }
}
