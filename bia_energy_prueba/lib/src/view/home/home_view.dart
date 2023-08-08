import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewmodels/home/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(),
    );
  }
}
