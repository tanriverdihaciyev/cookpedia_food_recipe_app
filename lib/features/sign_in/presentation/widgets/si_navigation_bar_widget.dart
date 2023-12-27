import '../../../auth/presentation/states/auth_provider.dart';
import '../../../recipe/presentation/states/recipe_provider.dart';
import '../states/si_email_or_user_name_provider.dart';
import '../states/si_password_provider.dart';
import '../../../user/presentation/states/user_provider.dart';
import '../../../user_detail/presentation/states/user_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/companents/buttons/red_elevation_button.dart';
import '../../../../core/resources/routes.dart';
import '../states/si_form_key_provider.dart';
import '../states/si_loading_provider.dart';

class SIBottomNavigationBarWidget extends StatelessWidget {
  const SIBottomNavigationBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SIFormKeyProvider siFormKeyProvider = context.watch<SIFormKeyProvider>();
    SILoadingProvider siLoadingProvider = context.watch<SILoadingProvider>();

    return BottomAppBar(
      child: RedElevationButton(
          onTap: () async {
            if (siFormKeyProvider.key.currentState!.validate()) {
              siFormKeyProvider.key.currentState?.save();
              siLoadingProvider.changeLoading();
              await context
                  .read<AuthProvider>()
                  .eitherSignInEmailAuthOrFailure(
                    email: context
                        .read<SIEmailOrUserNameProvider>()
                        .userNameEmail!,
                    password: context.read<SIPasswordProvider>().password!,
                    userProvider: context.read<UserProvider>(),
                    userDetailProvider: context.read<UserDetailProvider>(),
                    recipeProvider: context.read<RecipeProvider>(),
                  )
                  .then((_) async {
                AuthProvider authProvider = context.read<AuthProvider>();
                if (authProvider.failure != null) {
                  siLoadingProvider.changeLoading();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(authProvider.failure!.message),
                    ),
                  );
                } else if (authProvider.auth != null) {
                  siLoadingProvider.changeLoading();
                  context.go(Routes.splashRoute);
                }
              });
            }
          },
          text: "Sign In"),
    );
  }
}
