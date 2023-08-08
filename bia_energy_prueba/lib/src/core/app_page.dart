import 'package:bia_energy_prueba/src/view/detail/home_view.dart';
import 'package:bia_energy_prueba/src/view/home/home_view.dart';
import 'package:bia_energy_prueba/src/view/splash/splash_view.dart';
import 'package:bia_energy_prueba/src/viewmodels/splash/splash_controller.dart';
import 'package:get/get.dart';

import '../viewmodels/initial_viewmodel.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash_screen,
      page: () => SplashScreen(),
      //binding: InitialViewModel(),
    ),
    GetPage(
      name: AppRoutes.home_screen,
      page: () => HomeScreen(),
      //binding: InitialViewModel(),
    ),
    GetPage(
      name: AppRoutes.detail_screen,
      page: () => DetailScreen(),
      //∫binding: MovieDetailsBinding(),
    ),
  ];
}
