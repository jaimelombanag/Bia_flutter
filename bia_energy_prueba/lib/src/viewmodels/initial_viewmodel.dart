import 'package:bia_energy_prueba/src/viewmodels/detail/detail_controller.dart';
import 'package:bia_energy_prueba/src/viewmodels/home/home_controller.dart';
import 'package:bia_energy_prueba/src/viewmodels/splash/splash_controller.dart';
import 'package:get/get.dart';

class InitialViewModel implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DetailController>(() => DetailController());
  }
}
