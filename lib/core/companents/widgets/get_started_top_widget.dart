import 'package:cookpedia_foodrecipe_app/core/extensions/context_ext.dart';
import 'package:flutter/material.dart';

import '../../resources/sizes.dart';

class GetStartedTopWidget extends StatelessWidget {
  const GetStartedTopWidget({
    super.key,
    required this.title,
    required this.body,
    this.height,
  });
  final double? height;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? context.height(Sizes.s0_2_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Sizes.s10.toDouble(),
          ),
          Text(
            body,
            style: context.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
