import 'package:flutter/services.dart';

import '../models/destination.dart';

class DestinationService {
  static Future<List<Destination>> fetchDestinations() async {
    String jsonString = await rootBundle.loadString('assets/destinations.json');
    return Destination.listFromJson(jsonString);
  }
}
