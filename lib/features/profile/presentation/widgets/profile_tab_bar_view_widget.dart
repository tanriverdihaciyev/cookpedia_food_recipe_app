import 'pv_about_view_widget.dart';
import 'pv_recipes_view_widget.dart';
import 'package:flutter/material.dart';

class ProfileTabBarViewWidget extends StatelessWidget {
  const ProfileTabBarViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        PVRecipesViewWidget(),
        PVAboutViewWidget(),
      ],
    );
  }
}
