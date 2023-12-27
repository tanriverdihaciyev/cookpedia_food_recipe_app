import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/ingredients/cr_ingredients_length_provider.dart';
import '../cr_sized_box_10.dart';
import 'cr_ingredients_tile_widget.dart';

class CRIngredientsTilesViewWidget extends StatefulWidget {
  const CRIngredientsTilesViewWidget({super.key});

  @override
  State<CRIngredientsTilesViewWidget> createState() =>
      _CRIngredientsTilesViewWidgetState();
}

class _CRIngredientsTilesViewWidgetState
    extends State<CRIngredientsTilesViewWidget>
    with AutomaticKeepAliveClientMixin<CRIngredientsTilesViewWidget> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<Widget> ingredients = [];
    for (int i = 0;
        i < context.watch<CRIngredientsLenghtProvider>().ingredentsLenght;
        i++) {
      ingredients.add(Column(
        children: [
          CRIngredientsTileWidget(index: i),
          const CRSizedBox10(),
        ],
      ));
    }
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: ingredients,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
