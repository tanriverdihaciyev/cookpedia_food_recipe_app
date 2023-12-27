import 'package:flutter/material.dart';

import '../../../../core/extensions/context_ext.dart';

class RVMoreRecipesLikeThisWidget extends StatelessWidget {
  const RVMoreRecipesLikeThisWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "More Recipes Like This",
            style: context.textTheme.bodyLarge,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
