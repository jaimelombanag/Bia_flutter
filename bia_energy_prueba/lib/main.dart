import 'package:bia_energy_prueba/src/core/app_page.dart';
import 'package:bia_energy_prueba/src/core/constants.dart';
import 'package:bia_energy_prueba/src/services/logger/bia_logger.dart';
import 'package:bia_energy_prueba/src/view/splash/splash_view.dart';
import 'package:bia_energy_prueba/src/viewmodels/initial_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/themes/app_themes_colors.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    BiaEnergyLogger.init();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.titleApp,
      theme: ThemeColor().themeData,
      home: SplashScreen(),
      initialBinding: InitialViewModel(),
      getPages: AppPages.pages,
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          minWidth: 400,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
    );
  }
}
