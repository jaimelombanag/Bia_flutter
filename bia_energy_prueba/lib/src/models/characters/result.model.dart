import 'package:bia_energy_prueba/src/models/characters/stories.model.dart';
import 'package:bia_energy_prueba/src/models/characters/thumbnail.model.dart';
import 'package:bia_energy_prueba/src/models/characters/url.model.dart';

import 'comics.model.dart';

class Result {
  int id;
  String name;
  String description;
  String modified;
  Thumbnail thumbnail;
  String resourceUri;
  Comics comics;
  Comics series;
  Stories stories;
  Comics events;
  List<Url> urls;

  Result({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
    required this.resourceUri,
    required this.comics,
    required this.series,
    required this.stories,
    required this.events,
    required this.urls,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        modified: json["modified"],
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        resourceUri: json["resourceURI"],
        comics: Comics.fromJson(json["comics"]),
        series: Comics.fromJson(json["series"]),
        stories: Stories.fromJson(json["stories"]),
        events: Comics.fromJson(json["events"]),
        urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "modified": modified,
        "thumbnail": thumbnail.toJson(),
        "resourceURI": resourceUri,
        "comics": comics.toJson(),
        "series": series.toJson(),
        "stories": stories.toJson(),
        "events": events.toJson(),
        "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
      };
}
