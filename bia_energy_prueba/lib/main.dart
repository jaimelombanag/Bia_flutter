import 'package:bia_energy_prueba/src/core/app_page.dart';
import 'package:bia_energy_prueba/src/view/splash/splash_view.dart';
import 'package:bia_energy_prueba/src/viewmodels/initial_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/themes/app_themes_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bia Energy app',
      theme: ThemeColor().themeData,
      home: SplashScreen(),
      initialBinding: InitialViewModel(),
      getPages: AppPages.pages,
    );
  }
}
