import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_ui_kit/model/pokemon.dart';

class PokeApiServices {
  // Get pokemon list of a region from PokeApi based
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
          pokemonList.add(Pokemon.fromJsonPokemonList(item));
        }
        return pokemonList;
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  // Get pokemon detailed information from PokeApi
  static Future<Pokemon?> getPokemon(int entry) async {
    String pokemonUrl = "https://pokeapi.co/api/v2/pokemon/$entry/";
    Uri detailPokemonId = Uri.parse(pokemonUrl);
    final response = await http.get(detailPokemonId);
    final result = jsonDecode(response.body);
    if (result != null) {
      Pokemon pokemon = Pokemon.fromJson(result);
      return pokemon;
    }
    return null;
  }
}
