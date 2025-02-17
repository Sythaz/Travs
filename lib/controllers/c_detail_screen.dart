import 'package:get/get.dart';
import 'package:travs/controllers/c_favorite.dart';

class CDetailScreen extends GetxController {
  final cFavorite = Get.put(CFavorite());

  toggleFavorite(nameDestination) async {
    if (cFavorite.favoriteList
        .any((fav) => fav.destinationName == nameDestination)) {
      await cFavorite.removeItemFavorite(nameDestination);
    } else {
      await cFavorite.insertFavorite(nameDestination);
    }
  }
}
