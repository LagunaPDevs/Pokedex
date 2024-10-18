import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_ui_kit/model/pokemon.dart';

class PokeApiServices {
  static Future<List<Pokemon>> getPokemonList(
      {required String regionName}) async {
    try {
      final String regionPath =
          "https://pokeapi.co/api/v2/pokedex/$regionName/";
      Uri url = Uri.parse(regionPath);
      final response = await http.get(url);
      final result = jsonDecode(response.body);
      if (result["pokemon_entries"].length > 0) {
        List<dynamic> pokemonArray = result["pokemon_entries"];
        List<Pokemon> pokemonList = [];
        for (var item in pokemonArray) {
          pokemonList.add(Pokemon(
              id: item["entry_number"],
              name: item["pokemon_species"]["name"],
              image:
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${item["entry_number"]}.png",
              height: 0,
              weight: 0,
              types: []));
        }
        return pokemonList;
      }
      return [];
    } catch (e) {
      print(e);
    }
    return [];
  }

  static Future<Pokemon?> getPokemon(int entry) async {
    String pokemonUrl = "https://pokeapi.co/api/v2/pokemon/$entry/";
    Uri detailPokemonId = Uri.parse(pokemonUrl);
    final response = await http.get(detailPokemonId);
    final result = jsonDecode(response.body);
    if (result != null) {
      var resultTypeArray = result["types"];
      List<String> typeArray = [];
      for (var type in resultTypeArray) {
        typeArray.add(type["type"]["name"]);
      }
      Pokemon pokemon = Pokemon(
          id: result["id"],
          name: result["name"],
          image: result["sprites"]["other"]["official-artwork"]
              ["front_default"],
          height: result["height"],
          weight: result["weight"],
          types: typeArray);
      return pokemon;
    }
    return null;
  }
}
