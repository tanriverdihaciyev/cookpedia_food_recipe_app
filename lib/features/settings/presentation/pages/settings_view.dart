import 'package:cookpedia_foodrecipe_app/core/resources/routes.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/sizes.dart';
import '../../../auth/presentation/states/auth_provider.dart';
import '../../../follow/presentation/states/follow_provider.dart';
import '../../../recipe/presentation/states/recipe_provider.dart';
import '../../../user/presentation/states/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: context.paddingAllMedium,
        child: Column(
          children: [
            SListTileWidget(
              title: "Personal Info",
              icon: Icons.person,
              color: Colors.red.shade700,
              onTapIcon: () => context.go(Routes.personalInfoRoute),
            ),
            SListTileWidget(
              title: "Notifaction",
              icon: Icons.notifications_rounded,
              color: Colors.yellow.shade700,
              onTapIcon: () {},
            ),
            SListTileWidget(
              title: "Security",
              icon: Icons.security,
              color: Colors.green.shade700,
              onTapIcon: () {},
            ),
            SListTileWidget(
              title: "Language",
              icon: Icons.language,
              color: Colors.blue.shade700,
              title2: "English (US)",
              onTapIcon: () {},
            ),
            SListTileWidget(
              title: "Dark Mode",
              icon: Icons.visibility,
              color: Colors.blue.shade700,
              trailing: Switch(
                activeColor: Colors.white,
                activeTrackColor: Colors.red,
                inactiveTrackColor: Colors.grey,
                inactiveThumbColor: Colors.white,
                value: true,
                onChanged: (value) {},
              ),
            ),
            const Divider(),
            SListTileWidget(
              title: "Invite Friends",
              icon: Icons.groups,
              color: Colors.yellow.shade700,
              onTapIcon: () {},
            ),
            SListTileWidget(
              title: "Help Center",
              icon: Icons.edit_document,
              color: Colors.green.shade700,
              onTapIcon: () {},
            ),
            SListTileWidget(
              title: "About Cookpedia",
              icon: Icons.info_sharp,
              color: Colors.blue.shade700,
              onTapIcon: () {},
            ),
            SListTileWidget(
              title: "Logout",
              icon: Icons.logout,
              color: Colors.red.shade700,
              onTap: () async {
                await context
                    .read<AuthProvider>()
                    .eitherSignOutVoidOrFailure(
                      userProvider: context.read<UserProvider>(),
                      recipeProvider: context.read<RecipeProvider>(),
                      followProvider: context.read<FollowProvider>(),
                    )
                    .then((value) => context.go(Routes.splashRoute));
              },
              trailing: const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

class SListTileWidget extends StatelessWidget {
  const SListTileWidget({
    super.key,
    required this.title,
    required this.color,
    required this.icon,
    this.onTapIcon,
    this.title2,
    this.trailing,
    this.onTap,
  });
  final String title;
  final String? title2;
  final Color color;
  final IconData icon;
  final void Function()? onTapIcon;
  final void Function()? onTap;

  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(context.width(Sizes.s0_1)),
      onTap: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: context.textTheme.titleMedium,
            ),
            if (title2 != null)
              Text(
                title2!,
                style: context.textTheme.titleSmall,
              )
          ],
        ),
        trailing: trailing ??
            InkWell(
              borderRadius: BorderRadius.circular(context.width(Sizes.s0_1)),
              radius: context.width(Sizes.s0_1),
              onTap: onTapIcon,
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: context.width(Sizes.s0_0_5),
              ),
            ),
      ),
    );
  }
}
