import 'package:bia_energy_prueba/src/models/characters/result.model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget itemCharacter(Result result) {
  return Card(
    child: InkWell(
      onTap: () {
        print("tapped");
      },
      child: Container(
        width: 120.0,
        height: 120.0,
        child: Image(image: NetworkImage("${result.thumbnail.path}.jpg")),
      ),
    ),
  );
}
