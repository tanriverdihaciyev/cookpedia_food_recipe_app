import 'package:cookpedia_foodrecipe_app/core/extensions/context_ext.dart';
import 'package:cookpedia_foodrecipe_app/features/get_started/presentation/pages/step_2/states/gs_step_2_form_key_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/companents/cards/food_preferences_card.dart';
import '../../../../../../core/companents/widgets/get_started_top_widget.dart';
import '../../../../../../core/resources/strings.dart';
import '../states/gs_food_prefrence_provider.dart';

class GSStep2BodyWidget extends StatelessWidget {
  const GSStep2BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GSFoodPrefrenceProvider gsFoodPrefrenceProvider =
        Provider.of<GSFoodPrefrenceProvider>(context);
    GSStep2FormKeyProvider gsStep2FormKeyProvider =
        Provider.of<GSStep2FormKeyProvider>(context);

    return Form(
      key: gsStep2FormKeyProvider.key,
      child: FormField(
        validator: (_) {
          if (gsFoodPrefrenceProvider.selectedsFoodPrefs.isEmpty) {
            return "Is not empty";
          }
          return null;
        },
        builder: (field) {
          return Column(
            children: [
              const GetStartedTopWidget(
                title: Strings.step_2_title,
                body: Strings.step_2_body,
              ),
              if (field.hasError)
                Text(
                  field.errorText!,
                  style:
                      context.textTheme.labelLarge!.copyWith(color: Colors.red),
                ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: gsFoodPrefrenceProvider.foodsPrefs.length,
                  itemBuilder: (context, index) {
                    return FoodPreferencesCard(
                      foodPrefrence: gsFoodPrefrenceProvider.foodsPrefs[index],
                      isSelected: gsFoodPrefrenceProvider.isSelectedFoodPrefs(
                          gsFoodPrefrenceProvider.foodsPrefs[index]),
                      onTap: () {
                        gsFoodPrefrenceProvider.setFoodPref(
                            gsFoodPrefrenceProvider.foodsPrefs[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
