import 'dart:ffi';

import 'package:bia_energy_prueba/src/api/characters/characters_api.dart';
import 'package:bia_energy_prueba/src/models/characters/response_character.model.dart';
import 'package:bia_energy_prueba/src/models/characters/result.model.dart';
import 'package:bia_energy_prueba/src/services/logger/bia_logger.dart';
import 'package:bia_energy_prueba/src/viewmodels/home/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

class MockResponseCharacter extends Mock implements ResponseCharacters {}

class MockResult extends Mock implements Result {}

class MockBiaEnergyLogger extends Mock implements BiaEnergyLogger {}

class MockHttpClient extends Mock implements Client {}

void main() {
  test("Home Controller getCharters", () async {
    MockBiaEnergyLogger;
    final bindings = BindingsBuilder(() {
      Get.lazyPut<HomeController>(() => HomeController());
    });
    bindings.builder();

    final respose = MockResponseCharacter();

    final homeController = Get.find<HomeController>();
    final jokey = await homeController.getCharacters();

    expect(jokey, true);
  });
}
