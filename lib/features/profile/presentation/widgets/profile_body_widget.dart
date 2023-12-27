import 'package:cookpedia_foodrecipe_app/core/extensions/context_ext.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/sizes.dart';
import 'profile_body_sliver_app_bar_widget.dart';
import 'profile_tab_bar_view_widget.dart';

class ProfileBodyWidget extends StatelessWidget {
  const ProfileBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Sizes.s2,
      child: Padding(
        padding: context.paddingHorizMedium,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const ProfileBodySliverAppBarWidget(),
          ],
          body: const ProfileTabBarViewWidget(),
        ),
      ),
    );
  }
}
