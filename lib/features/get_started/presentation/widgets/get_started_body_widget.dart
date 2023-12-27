import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/companents/widgets/app_loading_widget.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/sizes.dart';
import '../pages/step_0/gs_step_0_view.dart';
import '../pages/step_1/step_1_view.dart';
import '../pages/step_2/gs_step_2_view.dart';
import '../pages/step_3/gs_step_3_view.dart';
import '../pages/step_4/gs_step_4_view.dart';
import '../pages/step_5/gs_step_5_view.dart';
import '../states/get_started_loading_provider.dart';
import '../states/get_started_step_provider.dart';

class GetStartedBodyWidget extends StatelessWidget {
  const GetStartedBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SizedBox(
            height: double.infinity,
            width: context.width(Sizes.s0_9),
            child: IndexedStack(
              index: context.watch<GetStartedStepProvider>().step,
              children: const [
                GSStep0View(),
                GSStep1View(),
                GSStep2View(),
                GSStep3View(),
                GSStep4View(),
                GSStep5View(),
              ],
            ),
          ),
        ),
        context.watch<GetStartedLoadingProvider>().isLoading
            ? const AppLoadingWidget()
            : const SizedBox(),
      ],
    );
  }
}
