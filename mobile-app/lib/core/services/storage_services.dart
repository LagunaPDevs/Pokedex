// external libraries
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pokedex/core/constants/storage_constants.dart';
// project imports
import 'package:pokedex/core/models/storaged_captured_pokemon.dart';

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
      return capturedPokemons;
    }
    return StoragedCapturedPokemons(capturedPokemons: []);
  }
}
