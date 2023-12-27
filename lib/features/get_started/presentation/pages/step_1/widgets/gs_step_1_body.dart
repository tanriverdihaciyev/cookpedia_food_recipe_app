import 'package:cookpedia_foodrecipe_app/core/extensions/context_ext.dart';
import 'package:cookpedia_foodrecipe_app/features/get_started/presentation/pages/step_1/states/gs_step_1_form_key_provider.dart';

import '../../../../../../core/companents/cards/cooking_level_card.dart';
import '../../../../../../core/companents/widgets/get_started_top_widget.dart';
import '../../../../../../core/resources/strings.dart';
import '../states/gs_cooking_level_provider.dart';
import '../states/gs_cooking_level_selected_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GSStep1BodyWidget extends StatelessWidget {
  const GSStep1BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GSCookingLevelProvider cookingLevelProvider =
        Provider.of<GSCookingLevelProvider>(context);
    GSCookingLevelSelectedProvider cookingLevelSelectedProvider =
        Provider.of<GSCookingLevelSelectedProvider>(context);
    GSStep1FormKeyProvider gsStep1FormKeyProvider =
        Provider.of<GSStep1FormKeyProvider>(context);

    return Form(
      key: gsStep1FormKeyProvider.key,
      child: FormField<void>(
        validator: (_) {
          if (cookingLevelSelectedProvider.selectedLevel == null) {
            return "Is not empty";
          }
          return null;
        },
        builder: (field) {
          return Column(
            children: [
              const GetStartedTopWidget(
                title: Strings.step_1_title,
                body: Strings.step_1_body,
              ),
              if (field.hasError)
                Text(
                  field.errorText!,
                  style:
                      context.textTheme.labelLarge!.copyWith(color: Colors.red),
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: cookingLevelProvider.levels.length,
                  itemBuilder: (context, index) {
                    return CookingLevelCard(
                      cookingLevel: cookingLevelProvider.levels[index],
                      index: index,
                      selectedIndex: cookingLevelSelectedProvider.selectedLevel,
                      onTap: () =>
                          cookingLevelSelectedProvider.selectLevel(index),
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
