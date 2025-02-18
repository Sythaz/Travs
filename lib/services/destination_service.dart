import 'package:flutter/services.dart';

import '../models/destination.dart';

class DestinationService {
  static Future<List<DestinationModel>> fetchDestinations() async {
    String jsonString = await rootBundle.loadString('assets/destinations.json');
    return DestinationModel.listFromJson(jsonString);
  }
}
