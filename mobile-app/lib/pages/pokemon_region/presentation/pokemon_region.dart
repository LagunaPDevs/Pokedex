import 'package:flutter/material.dart';

// project imports
import 'package:pokedex/core/helpers/base_page.dart';
import 'package:pokedex/pages/pokemon_region/bloc/pokemon_region_cubit.dart';

// ui_kit
import 'package:pokedex_ui_kit/constants/svg_icons_constants.dart';
import 'package:pokedex_ui_kit/widgets/app_bars/pokemon_list_app_bar.dart';
import 'package:pokedex_ui_kit/widgets/grids/pokemon_grid_list.dart';
import 'package:pokedex_ui_kit/widgets/text_fields/rounded_text_field.dart';

class PokemonRegion extends BasePage<PokemonRegionState, PokemonRegionCubit> {
  final String regionName;
  const PokemonRegion({super.key, required this.regionName});
  @override
  PokemonRegionCubit createBloc(BuildContext context) =>
      PokemonRegionCubit()..init(context, regionName: regionName);

  @override
  Widget buildPage(
      BuildContext context, PokemonRegionState state, PokemonRegionCubit bloc) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: PokemonListAppBar(
          backgroundColor: state.appbarColor,
          title: regionName,
          isExpanded: state.expandedAppbar,
          hideFunction: () => bloc.onExpandableClick(),
          actionSvgPath: PokedexIcons.search,
          child: RoundedTextField(
            controller: TextEditingController(),
            hintText: "Search",
            onFieldSubmitted: (value) => bloc.onSearch(value),
          ),
        ),
        body: PokemonGridList(
            isLoading: state.isLoading,
            pokemonList: state.pokemonList,
            onPokemonClick: (id) => bloc.onClick(context, id: id)));
  }
}
