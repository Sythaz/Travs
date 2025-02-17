import 'package:get/get.dart';

class CHome extends GetxController {
  final _indexPage = 0.obs;

  int get getIndexPage => _indexPage.value;
  set setIndexPage(newIndex) => _indexPage.value = newIndex;
}
