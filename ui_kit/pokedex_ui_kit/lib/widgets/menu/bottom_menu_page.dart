import 'package:flutter/material.dart';

// package imports
import 'package:pokedex_ui_kit/model/bottom_menu_item_model.dart';
import 'package:pokedex_ui_kit/theme/color_constants.dart';
import 'package:pokedex_ui_kit/widgets/menu/bottom_menu_item.dart';

class BottomMenuPage extends StatelessWidget {
  final Color? backgroundColor;
  final int pageIndex;
  final Function(int) onTap;
  final Function(int) onPageChanged;
  final PageController pageController;
  final List<BottomMenuItemModel> itemPageModel;
  final curve = Curves.decelerate;
  final duration = const Duration(milliseconds: 400);

  const BottomMenuPage(
      {super.key,
      this.backgroundColor,
      required this.pageIndex,
      required this.onTap,
      required this.onPageChanged,
      required this.pageController,
      required this.itemPageModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
        controller: pageController,
        children: itemPageModel.map((item) => item.page).toList(),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: duration,
        curve: curve,
        height: 60,
        color: backgroundColor != null
            ? backgroundColor!.withOpacity(0.85)
            : PokedexThemeColor.whiteColor.withOpacity(0.85),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: List.generate(
            itemPageModel.length,
            (index) => Expanded(
              child: BottomMenuItem(
                onTap: () => onTap(index),
                selected: pageIndex == index,
                selectedSvgPath: itemPageModel[index].selectedSVG,
                unselectedSvgPath: itemPageModel[index].unselectedSVG,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
