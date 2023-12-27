import 'package:cookpedia_foodrecipe_app/core/resources/assets.dart';
import 'package:flutter/material.dart';

import '../../resources/sizes.dart';

class ProfilImageWidget extends StatelessWidget {
  const ProfilImageWidget({
    super.key,
    this.sizes,
    this.image,
    required this.onTap,
  });
  final double? sizes;
  final ImageProvider? image;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: sizes ?? Sizes.s100,
          height: sizes ?? Sizes.s100,
          margin: EdgeInsets.only(
            bottom: Sizes.s15.toDouble(),
            right: Sizes.s15.toDouble(),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: image ??
                  AssetImage(
                    AssetsPaths.chef.imageToPath,
                  ),
            ),
          ),
        ),
        Positioned(
          bottom: Sizes.s0.toDouble(),
          right: Sizes.s0.toDouble(),
          child: IconButton(
            onPressed: onTap,
            icon: const Icon(
              Icons.image,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
