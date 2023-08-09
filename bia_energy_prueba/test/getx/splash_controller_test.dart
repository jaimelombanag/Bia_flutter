import 'package:bia_energy_prueba/src/viewmodels/splash/splash_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  test("Splash Controller startAnimation", () {
    final bindings = BindingsBuilder(() {
      Get.lazyPut<SplashController>(() => SplashController());
    });
    bindings.builder();
    final splashController = Get.find<SplashController>();
    splashController.startAnimation();
  });
}
