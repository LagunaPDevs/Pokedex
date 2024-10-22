import 'dart:math';
import 'package:flutter/material.dart';

// external libraries
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedShakingSvg extends StatefulWidget {
  final String svgPath;

  const AnimatedShakingSvg({super.key, required this.svgPath});
  @override
  State<AnimatedShakingSvg> createState() => _AnimatedShakingSvgState();
}

class _AnimatedShakingSvgState extends State<AnimatedShakingSvg>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.elasticInOut,
      ),
    );
    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, Widget? child) => Transform.translate(
        offset: Offset(
            animationController.value *
                10.0 *
                sin(animationController.value * 10.0),
            0),
        child: child,
      ),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 80, maxWidth: 80),
        child: SizedBox(
          width: 48,
          height: 48,
          child: SvgPicture.asset(
            widget.svgPath,
          ),
        ),
      ),
    );
  }
}
