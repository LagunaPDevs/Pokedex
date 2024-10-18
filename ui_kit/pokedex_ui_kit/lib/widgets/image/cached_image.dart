import 'package:flutter/material.dart';

// package imports
import 'package:pokedex_ui_kit/theme/color_constants.dart';

// external libraries
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

typedef BuildBody = Widget Function(BuildContext context, ImageProvider url);

class CachedImage extends StatelessWidget {
  final String image;
  final BuildBody buildBody;

  const CachedImage({
    super.key,
    required this.image,
    required this.buildBody,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, url) => buildBody(context, url),
      progressIndicatorBuilder: (context, url, indicator) => Shimmer.fromColors(
        baseColor: lightGreyColor,
        highlightColor: whiteColor,
        child: buildBody(
          context,
          NetworkImage(url),
        ),
      ),
      errorWidget: (context, url, error) => buildBody(
        context,
        const AssetImage("assets/silhouette.png"),
      ),
    );
  }
}