import 'package:bia_energy_prueba/src/api/characters/characters_api.dart';
import 'package:bia_energy_prueba/src/models/characters/result.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../services/logger/bia_logger.dart';
import '../../view/home/widgets/item_character.dart';

class HomeController extends GetxController {
  static HomeController get find => Get.find();
  var listCharacters = <Result>[].obs;

  Future<void> getCharacters() async {
    try {
      listCharacters.value = [];
      ApiCharacters recover = ApiCharacters();
      listCharacters.value = await recover.getCharacters();
      BiaEnergyLogger.verbose("HomeController",
          "El tamaño de la lista es ${listCharacters.length}");
    } on Exception {
      BiaEnergyLogger.verbose('HomeController', 'Error: recover fail.');
    }
  }

  List<Widget> widgetListCharacter() {
    List<Widget> items = [];
    for (int i = 0; i < listCharacters.length; i++) {
      BiaEnergyLogger.verbose('HomeController',
          "Extension imagen es: ${listCharacters[i].thumbnail.extension.name}");
      items.add(itemCharacter(listCharacters[i]));
    }
    return items;
  }
}
