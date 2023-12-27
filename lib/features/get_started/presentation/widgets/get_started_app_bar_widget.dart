import '../pages/step_1/states/gs_cooking_level_selected_provider.dart';
import '../states/get_started_step_provider.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/resources/sizes.dart';
import '../pages/step_0/states/gs_country_provider.dart';
import '../pages/step_2/states/gs_food_prefrence_provider.dart';
import '../pages/step_3/states/gs_dietory_prefs_provider.dart';
import '../pages/step_4/states/gs_step_4_global_key_provider.dart';
import '../pages/step_5/states/gs_step_5_global_key_provider.dart';
import '../states/get_started_progress_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetStartedAppBarWidget extends StatelessWidget {
  const GetStartedAppBarWidget({super.key});

  @override
  AppBar build(BuildContext context) {
    GetStartedProgressProvider progressProvider =
        context.watch<GetStartedProgressProvider>();
    GetStartedStepProvider stepProvider =
        context.watch<GetStartedStepProvider>();
    return AppBar(
      leading: IconButton(
        onPressed: () {
          if (stepProvider.step == 0) {
            context.read<GSCountryProvider>().resetCountry();
            context.read<GSCookingLevelSelectedProvider>().resetLevel();
            context.read<GSFoodPrefrenceProvider>().resetFoodPrefs();
            context.read<GSDietoryPrefsProvider>().resetDietPrefs();
            context.read<GSStep4FormKeyProvider>().resetAll(context);
            context.read<GSStep5FormKeyProvider>().resetAll(context);
            context.go(Routes.splashRoute);
          } else {
            stepProvider.prevStep();
            progressProvider.decrementProgress(
              context.read<GetStartedStepProvider>(),
            );
          }
        },
        icon: const Icon(Icons.arrow_back),
      ),
      title: LinearProgressIndicator(
        value: progressProvider.progress,
        minHeight: Sizes.s15.toDouble(),
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      actions: [
        SizedBox(
          width: context.width(Sizes.s0_1),
        )
      ],
    );
  }
}
