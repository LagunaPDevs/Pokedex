// external libraries
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// project imports
import 'package:pokedex/core/constants/storage_constants.dart';
import 'package:pokedex/core/models/storaged_captured_pokemon.dart';
import 'package:pokedex_ui_kit/model/pokemon.dart';

class StorageServices {
  // Get captured pokemons from device storage
  static Future<StoragedCapturedPokemons> getCapturedPokemonsList(
      FlutterSecureStorage storage) async {
    String? capturedValue =
        await storage.read(key: StorageConstants.capturedPokemons) ?? "";
    if (capturedValue.isNotEmpty) {
      StoragedCapturedPokemons capturedPokemons =
          StoragedCapturedPokemons.storagedCapturedPokemonsDecode(
              capturedValue);
      String mostRepeatedType =
          getMostRepeatedType(capturedPokemons.capturedPokemons);
      saveMostRepeatedTypeInStorage(storage: storage, value: mostRepeatedType);
      return capturedPokemons;
    }
    return StoragedCapturedPokemons(capturedPokemons: []);
  }

  // Get most repeated type from a list of pokemons
  static String getMostRepeatedType(List<Pokemon> pokemonList) {
    List<String> mainTypeArray =
        pokemonList.map((pokemon) => pokemon.types.first).toList();
    if (mainTypeArray.isNotEmpty) {
      String mostRepeatedValue = getMostRepeatedValue(mainTypeArray);
      return mostRepeatedValue;
    }
    return "unknown";
  }

  // Get most repeated value in a string array
  static String getMostRepeatedValue(List<String> list) {
    Map<String, int> countMap = {};

    for (String value in list) {
      countMap[value] = (countMap[value] ?? 0) + 1;
    }
    String mostRepeatedValue = list.first;
    int maxCount = countMap[list.first]!;

    for (String value in list) {
      if (countMap[value]! > maxCount) {
        mostRepeatedValue = value;
        maxCount = countMap[value]!;
      }
    }

    return mostRepeatedValue;
  }

  // Save most repeated type in device storage
  static void saveMostRepeatedTypeInStorage(
      {required FlutterSecureStorage storage, required String value}) async {
    await storage.write(key: StorageConstants.trainerPokemonType, value: value);
  }
}
