import 'package:cookpedia_foodrecipe_app/core/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/companents/buttons/grey_elevation_button.dart';
import '../../../../core/companents/buttons/grey_opacity_elevation_button.dart';
import '../../../../core/companents/buttons/red_elevation_button.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/resources/sizes.dart';
import '../../../../core/resources/strings.dart';
import '../../../auth/presentation/states/auth_provider.dart';
import '../../../recipe/presentation/states/recipe_provider.dart';
import '../../../user/presentation/states/user_provider.dart';
import '../../../user_detail/presentation/states/user_detail_provider.dart';

class WBodyWidget extends StatelessWidget {
  const WBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: context.height(Sizes.s0_6),
        width: context.width(Sizes.s0_7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.welcome,
              style: context.textTheme.displaySmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.cookpedia,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.red),
                ),
                SizedBox(
                  width: Sizes.s15.toDouble(),
                ),
                const Icon(
                  Icons.waving_hand_rounded,
                  color: Colors.yellow,
                  size: Sizes.s35,
                )
              ],
            ),
            Text(Strings.welcomeDescript,
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium),
            const Divider(),
            GreyOpacityElevationButton(
              onPressed: () {
                context.read<AuthProvider>().eitherSignInOrUpGmailAuthOrFailure(
                      userProvider: context.read<UserProvider>(),
                      userDetailProvider: context.read<UserDetailProvider>(),
                      recipeProvider: context.read<RecipeProvider>(),
                    );
              },
              iconData: Icons.email,
              text: Strings.continueGoogle,
            ),
            RedElevationButton(
              onTap: () => context.go(Routes.getStartedRoute),
              text: Strings.getStarted,
              height: context.height(Sizes.s0_0_8),
            ),
            GreyElevationButton(
              onTap: () => context.go(Routes.signInRoute),
              text: Strings.iAlreadyHave,
              height: context.height(Sizes.s0_0_8),
            )
          ],
        ),
      ),
    );
  }
}
