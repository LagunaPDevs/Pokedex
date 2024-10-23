import 'package:flutter/material.dart';

// project imports
import 'package:pokedex/core/helpers/base_page.dart';
import 'package:pokedex/pages/captured_pokemons/presentation/captured_pokemons.dart';
import 'package:pokedex/pages/pokemon_region/presentation/pokemon_region.dart';
import 'package:pokedex/pages/root_page/bloc/root_cubit.dart';

// ui_kit
import 'package:pokedex_ui_kit/model/bottom_menu_item_model.dart';
import 'package:pokedex_ui_kit/widgets/menu/bottom_menu_page.dart';
import 'package:pokedex_ui_kit/constants/svg_icons_constants.dart';

class RootPage extends BasePage<RootState, RootCubit> {
  const RootPage({super.key});

  @override
  RootCubit createBloc(BuildContext context) => RootCubit()..init(context);

  @override
  Widget buildPage(BuildContext context, RootState state, RootCubit bloc) {
    return BottomMenuPage(
        pageIndex: state.pageIndex,
        onTap: (index) => bloc.changePage(index),
        onPageChanged: (index) => bloc.changePage(index),
        pageController: state.pageController,
        itemPageModel: [
          BottomMenuItemModel(
              page: const PokemonRegion(regionName: "kanto"),
              selectedSVG: PokedexIcons.pokepin,
              unselectedSVG: PokedexIcons.emptyPokepin),
          BottomMenuItemModel(
              page: const CapturedPokemons(),
              selectedSVG: PokedexIcons.colouredPokeball,
              unselectedSVG: PokedexIcons.pokeball)
        ]);
  }
}
