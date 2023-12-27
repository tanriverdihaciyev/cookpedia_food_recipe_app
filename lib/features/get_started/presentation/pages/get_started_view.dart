import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/sizes.dart';
import '../widgets/get_started_app_bar_widget.dart';
import '../widgets/get_started_body_widget.dart';
import '../widgets/get_started_bottom_app_bar_widget.dart';
import 'step_0/states/gs_step_0_form_key_provider.dart';
import 'step_1/states/gs_step_1_form_key_provider.dart';
import 'step_2/states/gs_step_2_form_key_provider.dart';
import 'step_3/states/gs_step_3_form_key_provider.dart';
import 'step_4/states/gs_image_path_provider.dart';
import 'step_4/states/gs_step_4_global_key_provider.dart';
import 'step_5/states/gs_confirm_password_provider.dart';
import 'step_5/states/gs_confirm_password_visibility_provider.dart';
import 'step_5/states/gs_password_visibility_provider.dart';
import 'step_5/states/gs_remember_provider.dart';
import 'step_5/states/gs_step_5_global_key_provider.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(
          create: (context) => GSStep0FormKeyProvider(),
        ),
        ListenableProvider(
          create: (context) => GSStep1FormKeyProvider(),
        ),
        ListenableProvider(
          create: (context) => GSStep2FormKeyProvider(),
        ),
        ListenableProvider(
          create: (context) => GSStep3FormKeyProvider(),
        ),
        ListenableProvider(
          create: (context) => GSStep4FormKeyProvider(),
        ),
        ListenableProvider(
          create: (context) => GSStep5FormKeyProvider(),
        ),
        ListenableProvider(
          create: (context) => GSConfirmPasswordProvider(),
        ),
        ListenableProvider(
          create: (context) => GSConfirmPasswordVisibilityPorvider(),
        ),
        ListenableProvider(
          create: (context) => GSPasswordVisibilityPorvider(),
        ),
        ListenableProvider(
          create: (context) => GSRememberProvider(),
        ),
        ListenableProvider(
          create: (context) => GSImagePathProvider(),
        ),
      ],
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(context.width(), context.height(Sizes.s0_1)),
            child: const GetStartedAppBarWidget()),
        body: const GetStartedBodyWidget(),
        bottomNavigationBar: const GetStartedBottomAppBarWidget(),
      ),
    );
  }
}
