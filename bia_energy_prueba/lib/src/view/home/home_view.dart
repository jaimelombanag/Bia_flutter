import 'package:bia_energy_prueba/src/view/home/widgets/characters_access.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewmodels/home/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController.find.getCharacters();
    final List numbers = List.generate(30, (index) => "Item $index");
    return Scaffold(
        appBar: AppBar(
          title: const Text('Marvel '),
          automaticallyImplyLeading: false,
        ),
        // Implement the GridView
        body: CharactersAccess()

        // GridView(
        //   padding: const EdgeInsets.all(25),
        //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        //       maxCrossAxisExtent: 200,
        //       childAspectRatio: 3 / 2,
        //       crossAxisSpacing: 20,
        //       mainAxisSpacing: 20),
        //   children: numbers
        //       .map((e) => Container(
        //           color: Colors.amber,
        //           alignment: Alignment.center,
        //           child: Text(e)))
        //       .toList(),
        // ),
        );
  }
}
