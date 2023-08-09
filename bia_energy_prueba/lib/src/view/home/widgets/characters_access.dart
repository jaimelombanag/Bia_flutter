import 'package:bia_energy_prueba/src/models/characters/result.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../viewmodels/home/home_controller.dart';
import 'item_character.dart';

class CharactersAccess extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: double.infinity,
          child: Wrap(
            runSpacing: 3,
            spacing: 3,
            children: controller.widgetListCharacter(),
          ),
        ),
      ),
    );
  }
}
