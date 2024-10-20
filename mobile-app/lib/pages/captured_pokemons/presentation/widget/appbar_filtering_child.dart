import 'package:flutter/material.dart';
import 'package:pokedex/pages/captured_pokemons/bloc/captured_pokemons_cubit.dart';
import 'package:pokedex_ui_kit/theme/color_constants.dart';
import 'package:pokedex_ui_kit/utils/app_fonts.dart';

class AppBarFilteringChild extends StatelessWidget {
  final CapturedPokemonsCubit bloc;
  final CapturedPokemonsState state;
  const AppBarFilteringChild({
    super.key,
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Text(
            "Sort by",
            style: PokedexFontStyle(context)
                .body3
                .copyWith(color: PokedexThemeColor.whiteColor),
          ),
          Row(
            children: List.generate(
                state.filtersList.length,
                (index) => Expanded(
                      child: RadioListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          value: state.filtersList[index],
                          groupValue: state.selectedFilter,
                          activeColor: PokedexThemeColor.whiteColor,
                          title: Text(
                            bloc.filterStringValue(state.filtersList[index]),
                            style: PokedexFontStyle(context)
                                .caption
                                .copyWith(color: PokedexThemeColor.whiteColor),
                          ),
                          onChanged: (value) => bloc.onFilterChange(value)),
                    )),
          ),
        ],
      ),
    );
  }
}
