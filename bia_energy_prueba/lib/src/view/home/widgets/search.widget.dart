import 'package:bia_energy_prueba/src/themes/app_themes_colors.dart';
import 'package:flutter/material.dart';

import '../../../viewmodels/home/home_controller.dart';

class search extends StatelessWidget {
  const search({
    super.key,
    required this.homecontroller,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final HomeController homecontroller;
  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          homecontroller.filterSearchResults(value);
        },
        controller: _searchController,
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          labelText: "Search",
          labelStyle: TextStyle(
            color: Colors.white, //<-- SEE HERE
          ),
          hintText: "Search",
          hintStyle: TextStyle(
            color: Colors.white, //<-- SEE HERE
          ),
          prefixIcon: Icon(
            Icons.search,
            color: ThemeColor.white,
          ),
          border: OutlineInputBorder(
            //Outline border type for TextFeild
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: Colors.redAccent,
              width: 3,
            ),
          ),
          focusColor: Colors.white,
        ),
      ),
    );
  }
}
