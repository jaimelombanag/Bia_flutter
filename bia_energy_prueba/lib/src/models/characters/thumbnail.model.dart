import 'enum_value.dart';

class Thumbnail {
  String path;
  Extension extension;

  Thumbnail({
    required this.path,
    required this.extension,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: extensionValues.map[json["extension"]]!,
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "extension": extensionValues.reverse[extension],
      };
}

final extensionValues =
    EnumValues({"gif": Extension.GIF, "jpg": Extension.JPG});

enum Extension { GIF, JPG }
