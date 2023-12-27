import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/companents/buttons/app_text_fom_button.dart';
import '../../../../core/companents/widgets/app_loading_widget.dart';
import '../../../../core/companents/widgets/get_started_top_widget.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/sizes.dart';
import '../../../../core/resources/strings.dart';
import '../states/forgot_password_view_model.dart';

class FPBodyWidget extends StatelessWidget {
  const FPBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    FPLoadingProvider fpLoadingProvider = context.watch<FPLoadingProvider>();

    return Stack(
      children: [
        Center(
          child: SizedBox(
            height: double.infinity,
            width: context.width(Sizes.s0_9),
            child: _step0(context),
          ),
        ),
        fpLoadingProvider.isLoading
            ? const AppLoadingWidget()
            : const SizedBox(),
      ],
    );
  }

  _step0(BuildContext context) {
    FPEmailProvider fpEmailProvider = context.watch<FPEmailProvider>();
    FPFormKeyProvider fpFormKeyProvider = context.watch<FPFormKeyProvider>();

    return Form(
      key: fpFormKeyProvider.key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GetStartedTopWidget(
            title: Strings.forgotPasswordTitle,
            body: Strings.forgotPasswordBody,
          ),
          AppTextFormButton(
            hintText: "Email",
            onSaved: (p0) {
              fpEmailProvider.saveEmail(p0!);
            },
            validator: (p0) {
              if (p0 == "" || p0 == null) {
                return "Not Empty";
              }
              return null;
            },
          )
        ],
      ),
    );
  }
}
