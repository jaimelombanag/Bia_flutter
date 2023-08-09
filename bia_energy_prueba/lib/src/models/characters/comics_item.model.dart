class ComicsItem {
  String resourceUri;
  String name;

  ComicsItem({
    required this.resourceUri,
    required this.name,
  });

  factory ComicsItem.fromJson(Map<String, dynamic> json) => ComicsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}
