import 'package:get/get.dart';

class CDetailScreen extends GetxController {
  RxBool isFavorite = false.obs;

  toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }
}
