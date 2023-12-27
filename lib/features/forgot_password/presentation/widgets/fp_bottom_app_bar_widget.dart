import 'package:cookpedia_foodrecipe_app/core/extensions/context_ext.dart';
import 'package:cookpedia_foodrecipe_app/core/params/email_params.dart';
import 'package:cookpedia_foodrecipe_app/core/resources/routes.dart';
import 'package:cookpedia_foodrecipe_app/features/auth/presentation/states/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/companents/buttons/red_elevation_button.dart';
import '../states/forgot_password_view_model.dart';

class FPBottomAppBarWidget extends StatelessWidget {
  const FPBottomAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FPFormKeyProvider fpFormKeyProvider = context.watch<FPFormKeyProvider>();
    FPLoadingProvider fpLoadingProvider = context.watch<FPLoadingProvider>();

    return BottomAppBar(
      child: RedElevationButton(
          onTap: () async {
            if (fpFormKeyProvider.key.currentState!.validate()) {
              fpFormKeyProvider.key.currentState?.save();
              fpLoadingProvider.changeLoading();
              AuthProvider authProvider = context.read<AuthProvider>();
              authProvider
                  .eitherSendPassResetEmail(
                params:
                    EmailParams(email: context.read<FPEmailProvider>().email!),
              )
                  .then((value) async {
                if (authProvider.resetPassfailure != null) {
                  fpLoadingProvider.changeLoading();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.white,
                      content: Text(
                        authProvider.resetPassfailure!.message,
                        style: context.textTheme.bodyMedium!
                            .copyWith(color: Colors.red),
                      ),
                    ),
                  );
                } else {
                  fpLoadingProvider.changeLoading();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.white,
                      content: Text("Send password reset link your email!"),
                    ),
                  );
                  await Future.delayed(const Duration(seconds: 2))
                      .then((value) => context.go(Routes.signInRoute));
                }
              });
            }
          },
          text: "Continue"),
    );
  }
}
