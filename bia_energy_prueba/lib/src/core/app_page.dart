import 'package:bia_energy_prueba/src/models/characters/character.dart';
import 'package:bia_energy_prueba/src/view/detail/detail_page.dart';
import 'package:bia_energy_prueba/src/view/home/home_view.dart';
import 'package:bia_energy_prueba/src/view/splash/splash_view.dart';
import 'package:get/get.dart';
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
      page: () => DetailPage(
        character: Character(),
      ),
      //∫binding: InitialViewModel(),
    ),
  ];
}
