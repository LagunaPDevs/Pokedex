import 'dart:convert';

import 'package:pokedex_ui_kit/model/pokemon.dart';

class StoragedCapturedPokemons {
  final List<Pokemon> capturedPokemons;
  StoragedCapturedPokemons({required this.capturedPokemons});

  factory StoragedCapturedPokemons.fromJson(Map<String, dynamic> json) =>
      StoragedCapturedPokemons(
          capturedPokemons: List<Pokemon>.from(
              json["capturedPokemons"].map((x) => Pokemon.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "capturedPokemons": capturedPokemons,
      };

  factory StoragedCapturedPokemons.storagedCapturedPokemonsDecode(String str) =>
      StoragedCapturedPokemons.fromJson(json.decode(str));

  String storagedCapturedPokemonsToEncode(StoragedCapturedPokemons data) =>
      json.encode(data.toJson());
}
