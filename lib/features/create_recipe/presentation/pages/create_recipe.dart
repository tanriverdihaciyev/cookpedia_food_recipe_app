import '../states/cr_cover_saved_provider.dart';
import '../states/cr_download_waiting_provider.dart';
import '../../../recipe_cover_image/presentation/states/recipe_cover_image_provider.dart';
import '../../../recipe_instruction_image/presentation/states/recipe_instruction_image_provider.dart';

import '../states/cr_cook_time_provider.dart';
import '../states/cr_description_provider.dart';
import '../states/cr_origin_provider.dart';
import '../states/cr_serves_provider.dart';
import '../states/cr_title_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/sizes.dart';
import '../states/cr_cover_image_provider.dart';
import '../states/cr_form_key_provider.dart';
import '../states/ingredients/cr_ingredients_length_provider.dart';
import '../states/ingredients/cr_ingredients_provider.dart';
import '../states/instruction/cr_instruction_all_field_provider.dart';
import '../states/instruction/cr_instruction_all_form_key_provider.dart';
import '../states/instruction/cr_instruction_entitys_provider.dart';
import '../states/instruction/cr_instruction_length_provider.dart';
import '../states/instruction/cr_instruction_provider.dart';
import '../widgets/cr_app_bar_widget.dart';
import '../widgets/cr_body_widget.dart';

class CreateRecipePage extends StatelessWidget {
  const CreateRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(
          create: (context) => CRDownloadWaitingProvider(),
        ),
        ListenableProvider(
          create: (context) => CRCoverImageProvider(),
        ),
        ListenableProvider(
          create: (context) => CRFormKeyProvider(),
        ),
        ListenableProvider(
          create: (context) => CRIngredientsProvider(),
        ),
        ListenableProvider(
          create: (context) => CRIngredientsLenghtProvider(),
        ),
        ListenableProvider(
          create: (context) => CRCoverSavedProvider(),
        ),
        ListenableProvider(
          create: (context) => CRInstructionEntitysProvider(),
        ),
        ListenableProvider(
          create: (context) => CRInstructionLenghtProvider(),
        ),
        ListenableProvider(
          create: (context) => CRInstructionProvider(),
        ),
        ListenableProvider(
          create: (context) => CRInstructionAllFieldFormKeyProvider(),
        ),
        ListenableProvider(
          create: (context) => CRInstructionAllFieldProvider(),
        ),
        ListenableProvider(
          create: (context) => CRTitleProvider(),
        ),
        ListenableProvider(
          create: (context) => CRDescriptionProvider(),
        ),
        ListenableProvider(
          create: (context) => CRCookTimeProvider(),
        ),
        ListenableProvider(
          create: (context) => CRServesProvider(),
        ),
        ListenableProvider(
          create: (context) => CROriginProvider(),
        ),
        ListenableProvider(
          create: (context) => RecipeCoverImageProvider(),
        ),
        ListenableProvider(
          create: (context) => RecipeInstructionImageProvider(),
        ),
      ],
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(
            context.width(),
            context.height(Sizes.s0_1),
          ),
          child: const CRAppBarWidget(),
        ),
        body: const CRBodyWidget(),
      ),
    );
  }
}
