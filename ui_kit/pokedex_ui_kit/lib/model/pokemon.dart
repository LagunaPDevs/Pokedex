import 'dart:convert';

class Pokemon {
  int id;
  String name;
  String image;
  int height;
  int weight;
  List<String> types;

  Pokemon(
      {required this.id,
      required this.name,
      required this.image,
      required this.height,
      required this.weight,
      required this.types});

  factory Pokemon.fromNoData() =>
      Pokemon(id: 0, name: "", image: "", height: 0, weight: 0, types: []);

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      height: json["height"],
      weight: json["weight"],
      types: List<String>.from(jsonDecode(json["types"])));

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "height": height,
        "weight": weight,
        "types": jsonEncode(types)
      };
}
