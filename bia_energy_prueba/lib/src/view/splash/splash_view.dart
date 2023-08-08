import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewmodels/splash/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashController.find.startAnimation();

    return Scaffold(
      body: Stack(
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
                  image: AssetImage('assets/images/logo2.jpeg'),
                ),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("tAppName",
                        style: Theme.of(context).textTheme.headline3),
                    Text("tAppTagLine",
                        style: Theme.of(context).textTheme.headline2)
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: controller.animate.value ? 100 : 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: controller.animate.value ? 1 : 0,
                child:
                    const Image(image: AssetImage('assets/images/logo1.jpeg')),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: controller.animate.value ? 60 : 0,
              right: 150,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: controller.animate.value ? 1 : 0,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
