import 'package:cookpedia_foodrecipe_app/core/resources/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/sizes.dart';

class ProfileAppBarWidget extends StatelessWidget {
  const ProfileAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: Sizes.s0.toDouble(),
      leading: Icon(
        Icons.cookie,
        color: Colors.amber.shade900,
      ),
      title: const Text("Profile"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.navigation_outlined),
        ),
        IconButton(
          onPressed: () => context.go(Routes.settingsRoute),
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}
