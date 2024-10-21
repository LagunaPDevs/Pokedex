import 'package:flutter/material.dart';
// project imports
import 'package:pokedex/core/helpers/base_page.dart';
import 'package:pokedex/pages/captured_pokemons/bloc/captured_pokemons_cubit.dart';
import 'package:pokedex/pages/captured_pokemons/presentation/widget/appbar_filtering_child.dart';

// ui_kit
import 'package:pokedex_ui_kit/constants/svg_icons_constants.dart';
import 'package:pokedex_ui_kit/theme/color_constants.dart';
import 'package:pokedex_ui_kit/widgets/app_bars/pokemon_list_app_bar.dart';
import 'package:pokedex_ui_kit/widgets/grids/pokemon_grid_list.dart';

class CapturedPokemons
    extends BasePage<CapturedPokemonsState, CapturedPokemonsCubit> {
  const CapturedPokemons({super.key});

  @override
  CapturedPokemonsCubit createBloc(BuildContext context) =>
      CapturedPokemonsCubit()..init(context);
  @override
  Widget buildPage(BuildContext context, CapturedPokemonsState state,
      CapturedPokemonsCubit bloc) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: PokemonListAppBar(
            isExpanded: state.expandedAppbar,
            actionSvgPath: PokedexIcons.sort,
            backgroundColor: state.appbarColor,
            hideFunction: () => bloc.onExpandableClick(),
            title: "My pokemons",
            child: AppBarFilteringChild(
              bloc: bloc,
              state: state,
            )),
        body: PokemonGridList(
            isLoading: state.isLoading,
            pokemonList: state.capturedList,
            onPokemonClick: (id) => bloc.onClick(context, id: id)));
  }
}
