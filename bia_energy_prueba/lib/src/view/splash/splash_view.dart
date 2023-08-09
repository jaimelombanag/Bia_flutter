import 'package:bia_energy_prueba/src/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../themes/app_themes_colors.dart';
import '../../viewmodels/splash/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashController.find.startAnimation();

    return Scaffold(
      body: Container(
        color: ThemeColor.primaryBlack,
        child: Stack(
          children: [
            Obx(
              () => AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                top: controller.animate.value ? 0 : -30,
                left: controller.animate.value ? 0 : -30,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1600),
                  opacity: controller.animate.value ? 1 : 0,
                  child: const Image(
                      image: AssetImage(Constants.logoBia), fit: BoxFit.cover),
                ),
              ),
            ),
            Obx(
              () => AnimatedPositioned(
                duration: const Duration(milliseconds: 2000),
                top: 80,
                left: controller.animate.value ? 80 : -80,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: controller.animate.value ? 1 : 0,
                  child: Container(),
                ),
              ),
            ),
            Obx(
              () => AnimatedPositioned(
                duration: const Duration(milliseconds: 2400),
                bottom: controller.animate.value ? 60 : 0,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: controller.animate.value ? 1 : 0,
                  child: const Image(
                      image: AssetImage(Constants.logoBia2),
                      height: 400,
                      width: 400,
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
