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
      image: json["sprites"] != null ? json["sprites"]["other"]["official-artwork"]["front_default"] : "",
      height: json["height"],
      weight: json["weight"],
      types: json["types"] != null ? List<String>.from(json["types"].map((x)=> x["type"]["name"])): []) ;

  factory Pokemon.fromJsonPokemonList(Map<String, dynamic> json) => Pokemon(
      id: json["entry_number"],
      name: json["pokemon_species"]["name"],
      image:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${json["entry_number"]}.png",
      height: 0,
      weight: 0,
      types: []);

  factory Pokemon.fromJsonStorage(Map<String, dynamic> json) => Pokemon(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      height: json["height"],
      weight: json["weight"],
      types: json["types"] != null ? List<String>.from(jsonDecode(json["types"])): []);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "height": height,
        "weight": weight,
        "types": jsonEncode(types)
      };
}
