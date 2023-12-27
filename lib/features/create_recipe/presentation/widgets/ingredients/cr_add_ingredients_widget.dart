import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/ingredients/cr_ingredients_length_provider.dart';
import '../cr_elevated_icon_button_widget.dart';

class CRAddIngredientsWidget extends StatelessWidget {
  const CRAddIngredientsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CRElevatedIconButtonWidget(
      onTap: () {
        context.read<CRIngredientsLenghtProvider>().incIngredentsLenght();
      },
      label: "Add Ingredients",
    );
  }
}
