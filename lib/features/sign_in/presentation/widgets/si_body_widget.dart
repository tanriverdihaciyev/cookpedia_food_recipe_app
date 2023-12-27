import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/companents/buttons/app_check_box_button.dart';
import '../../../../core/companents/buttons/app_text_fom_button.dart';
import '../../../../core/companents/buttons/grey_opacity_elevation_button.dart';
import '../../../../core/companents/widgets/app_loading_widget.dart';
import '../../../../core/companents/widgets/get_started_top_widget.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/resources/sizes.dart';
import '../../../../core/resources/strings.dart';
import '../states/si_email_or_user_name_provider.dart';
import '../states/si_form_key_provider.dart';
import '../states/si_loading_provider.dart';
import '../states/si_password_provider.dart';
import '../states/si_remember_provider.dart';
import '../states/si_visibility_provider.dart';

class SIBodyWidget extends StatelessWidget {
  const SIBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SIFormKeyProvider siFormKeyProvider = context.watch<SIFormKeyProvider>();
    SIEmailOrUserNameProvider siEmailOrUserNameProvider =
        context.watch<SIEmailOrUserNameProvider>();
    SIPasswordProvider siPasswordProvider = context.watch<SIPasswordProvider>();
    SIVisibilityProvider siVisibilityProvider =
        context.watch<SIVisibilityProvider>();
    SIRememberProvider siRememberProvider = context.watch<SIRememberProvider>();
    SILoadingProvider siLoadingProvider = context.watch<SILoadingProvider>();

    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: context.paddingAllMedium,
            child: Form(
              key: siFormKeyProvider.key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetStartedTopWidget(
                    title: Strings.signInTitle,
                    body: Strings.signInBody,
                    height: context.height(Sizes.s0_1_5),
                  ),
                  SizedBox(
                    height: Sizes.s10.toDouble(),
                  ),
                  AppTextFormButton(
                    hintText: "Username / Email",
                    onSaved: (p0) =>
                        siEmailOrUserNameProvider.addEmailUserName(p0!),
                    validator: (p0) {
                      if (p0 == null || p0 == "") {
                        return "Not Empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: Sizes.s10.toDouble(),
                  ),
                  AppTextFormButton(
                    hintText: "Password",
                    onSaved: (p0) => siPasswordProvider.addPassword(p0!),
                    validator: (p0) {
                      if (p0 == null || p0 == "") {
                        return "Not Empty";
                      }
                      return null;
                    },
                    obscureText: siVisibilityProvider.visibility,
                    suffixIcon: IconButton(
                      onPressed: () {
                        siVisibilityProvider.changeVisibilty();
                      },
                      icon: Icon(
                        siVisibilityProvider.visibility
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Sizes.s10.toDouble(),
                  ),
                  AppCheckBoxButton(
                    value: siRememberProvider.isRemember,
                    onChanged: (p0) => siRememberProvider.changeRemember(),
                  ),
                  const Divider(),
                  SizedBox(
                    height: Sizes.s10.toDouble(),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        context.go(Routes.forgotPasswordRoute);
                      },
                      child: Text(
                        "Forgot Password",
                        style: context.textTheme.titleMedium?.copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Sizes.s10.toDouble(),
                  ),
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Expanded(
                        child: Center(
                          child: Text(
                            "or continue with",
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(
                    height: Sizes.s10.toDouble(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GreyOpacityElevationButton(
                        onPressed: () {},
                        iconData: Icons.mail,
                        width: context.width(Sizes.s0_2_5),
                        borderSide:
                            BorderSide(color: Colors.grey.shade800, width: 2),
                      ),
                      GreyOpacityElevationButton(
                        onPressed: () {},
                        iconData: Icons.apple,
                        iconColor: Colors.white,
                        width: context.width(Sizes.s0_2_5),
                        borderSide:
                            BorderSide(color: Colors.grey.shade800, width: 2),
                      ),
                      GreyOpacityElevationButton(
                        iconData: Icons.facebook,
                        iconColor: Colors.blue,
                        onPressed: () {},
                        width: context.width(Sizes.s0_2_5),
                        borderSide:
                            BorderSide(color: Colors.grey.shade800, width: 2),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        siLoadingProvider.isLoading
            ? const AppLoadingWidget()
            : const SizedBox()
      ],
    );
  }
}
