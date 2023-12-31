import 'enum_value.dart';

class StoriesItem {
  String resourceUri;
  String name;
  ItemType type;

  StoriesItem({
    required this.resourceUri,
    required this.name,
    required this.type,
  });

  factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: itemTypeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": itemTypeValues.reverse[type],
      };
}

final itemTypeValues = EnumValues({
  "ad": ItemType.AD,
  "backcovers": ItemType.BACKCOVERS,
  "cover": ItemType.COVER,
  "": ItemType.EMPTY,
  "interiorStory": ItemType.INTERIOR_STORY,
  "pinup": ItemType.PINUP,
  "text article": ItemType.TEXT_ARTICLE
});

enum ItemType {
  AD,
  BACKCOVERS,
  COVER,
  EMPTY,
  INTERIOR_STORY,
  PINUP,
  TEXT_ARTICLE
}
