import 'package:cookpedia_foodrecipe_app/features/get_started/presentation/pages/step_5/states/gs_remember_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/companents/buttons/app_check_box_button.dart';
import '../../../../../../core/companents/widgets/get_started_top_widget.dart';
import '../../../../../../core/extensions/context_ext.dart';
import '../../../../../../core/resources/sizes.dart';
import '../../../../../../core/resources/strings.dart';
import '../states/gs_step_5_global_key_provider.dart';
import 'gs_step_5_confirm_password_text_form_button_widget.dart';
import 'gs_step_5_email_text_form_button_widget.dart';
import 'gs_step_5_password_text_form_button_widget.dart';
import 'gs_step_5_username_text_form_button_widget.dart';

class GSStep5BodyWidget extends StatelessWidget {
  const GSStep5BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GSStep5FormKeyProvider viewModel =
        Provider.of<GSStep5FormKeyProvider>(context);

    return SingleChildScrollView(
      child: Form(
        key: viewModel.key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetStartedTopWidget(
              title: Strings.step_5_title,
              body: Strings.step_5_body,
              height: context.height(Sizes.s0_1_6),
            ),
            const GSStep5UsernameTextFormButtonWidget(),
            SizedBox(
              height: Sizes.s10.toDouble(),
            ),
            const GSStep5EmailTextFormButtonWidget(),
            SizedBox(
              height: Sizes.s10.toDouble(),
            ),
            const GSStep5PasswordTextFormButtonWidget(),
            SizedBox(
              height: Sizes.s10.toDouble(),
            ),
            const GSStep5ConfirmPasswordTextFormButtonWidget(),
            AppCheckBoxButton(
              value: context.watch<GSRememberProvider>().isRemember,
              onChanged: (_) {
                context.read<GSRememberProvider>().changeRemember();
              },
            )
          ],
        ),
      ),
    );
  }
}
