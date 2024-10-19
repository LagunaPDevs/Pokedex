import 'package:flutter/material.dart';

// external libraries
import 'package:flutter_svg/flutter_svg.dart';

class PokemonInfoCard extends StatelessWidget {
  final String? iconPath;
  final String value;
  final String name;

  const PokemonInfoCard(
      {super.key, this.iconPath, required this.value, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 16,
                  height: 16,
                  child: SvgPicture.asset(iconPath ?? "")),
              const SizedBox(
                width: 8,
              ),
              Text(value, style: const TextStyle(fontSize: 16))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
