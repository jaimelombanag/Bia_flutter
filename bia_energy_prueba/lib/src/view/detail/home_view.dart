import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewmodels/detail/detail_controller.dart';

class DetailScreen extends GetView<DetailController> {
  DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(),
    );
  }
}
