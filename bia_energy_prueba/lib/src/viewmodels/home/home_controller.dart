import 'package:bia_energy_prueba/src/api/characters/characters_api.dart';
import 'package:bia_energy_prueba/src/models/characters/result.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../services/logger/bia_logger.dart';
import '../../models/characters/character.dart';
import '../../view/detail/detail_page.dart';

class HomeController extends GetxController {
  static HomeController get find => Get.find();
  var listCharacters = <Result>[].obs;
  var listCharacter = <Character>[].obs;
  var itemsFilter = <Character>[].obs;

  Future<bool> getCharacters() async {
    try {
      listCharacters.value = [];
      ApiCharacters recover = ApiCharacters();
      listCharacters.value = await recover.getCharacters();
      // BiaEnergyLogger.verbose("HomeController",
      //     "El tamaño de la lista es ${listCharacters.length}");

      for (int i = 0; i < listCharacters.length; i++) {
        // BiaEnergyLogger.verbose(
        //     'HomeController', '${listCharacters[i].thumbnail.path}.jpg');

        Character characters = Character(
          title: listCharacters[i].name,
          description: listCharacters[i].description,
          avatar:
              "${listCharacters[i].thumbnail.path}.${listCharacters[i].thumbnail.extension.name.toLowerCase()}",
          color: 0xFFE83835,
        );
        listCharacter.add(characters);
      }
      itemsFilter.value = listCharacter;
      return true;
    } on Exception {
      BiaEnergyLogger.verbose('HomeController', 'Error: recover fail.');
      return false;
    }
  }

  goToDetail(Character character, BuildContext context) {
    final page = DetailPage(character: character);
    Navigator.of(context).push(
      PageRouteBuilder<Null>(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return AnimatedBuilder(
                animation: animation,
                builder: (BuildContext context, Widget? child) {
                  return Opacity(
                    opacity: animation.value,
                    child: page,
                  );
                });
          },
          transitionDuration: Duration(milliseconds: 400)),
    );
  }

  void filterSearchResults(String query) {
    itemsFilter.value = listCharacter
        .where(
            (item) => item.title!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
