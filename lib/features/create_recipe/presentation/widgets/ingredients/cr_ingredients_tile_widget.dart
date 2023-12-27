import '../../../../../core/extensions/context_ext.dart';
import '../../../../../core/resources/sizes.dart';
import '../../states/ingredients/cr_ingredients_length_provider.dart';
import '../../states/ingredients/cr_ingredients_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CRIngredientsTileWidget extends StatefulWidget {
  const CRIngredientsTileWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<CRIngredientsTileWidget> createState() =>
      _CRIngredientsTileWidgetState();
}

class _CRIngredientsTileWidgetState extends State<CRIngredientsTileWidget>
    with AutomaticKeepAliveClientMixin<CRIngredientsTileWidget> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            size: 20,
          ),
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.grey.shade900,
            child: Text(
              "${widget.index + 1}",
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          Card(
            child: SizedBox(
              width: context.width(Sizes.s0_7),
              height: 60,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value == "") {
                    return "Is Not Empty";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  context
                      .read<CRIngredientsProvider>()
                      .addIngredients(newValue!, widget.index);
                },
                decoration:
                    InputDecoration(hintText: "Ingredients ${widget.index}"),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              context.read<CRIngredientsLenghtProvider>().dicIngredentsLenght();
            },
            child: const Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
