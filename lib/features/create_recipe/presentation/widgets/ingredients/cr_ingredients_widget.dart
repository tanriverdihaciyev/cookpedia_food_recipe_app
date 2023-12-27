import 'package:flutter/material.dart';

import '../titles/cr_title_large_widget.dart';

class CRIngredientsWidget extends StatelessWidget {
  const CRIngredientsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: CRTitleLargeWidget(label: "Ingredients:"),
    );
  }
}
