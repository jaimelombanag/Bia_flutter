import 'package:bia_energy_prueba/src/api/characters/characters_api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../services/logger/bia_logger.dart';

class HomeController extends GetxController {
  static HomeController get find => Get.find();

  Future<void> getCharacters() async {
    try {
      ApiCharacters recover = ApiCharacters();
      var characters = await recover.getCharacters();
    } on Exception {
      BiaEnergyLogger.verbose('HomeController', 'Error: recover fail.');
    }
  }
}
