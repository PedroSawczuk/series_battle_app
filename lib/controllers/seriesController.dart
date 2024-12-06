import 'package:get/get.dart';
import 'package:series_battle/models/seriesModel.dart';

class SeriesController extends GetxController {
  Rx<SeriesModel?> selectedSerie = Rx<SeriesModel?>(null);

  void selectSerie(SeriesModel serie) {
    selectedSerie.value = serie;
  }

  void clearSelection() {
    selectedSerie.value = null;
  }
}
