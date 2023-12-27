import '../../../../core/resources/routes.dart';
import '../states/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'main_bottom_app_bar_icon_widget.dart';

class MainBottomAppBarWidget extends StatelessWidget {
  const MainBottomAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider = context.watch<MainProvider>();
    return BottomAppBar(
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MainBottomAppBarIconWidget(
            label: "Home",
            onPressed: () => mainProvider.changePage(0),
            iconData: Icons.home_filled,
            isSelectedPage: mainProvider.isSelectedPage(0),
          ),
          MainBottomAppBarIconWidget(
            label: "Discover",
            onPressed: () => mainProvider.changePage(1),
            iconData: Icons.assistant_navigation,
            isSelectedPage: mainProvider.isSelectedPage(1),
          ),
          FloatingActionButton(
            onPressed: () => context.go(Routes.createRecipeRoute),
            child: const Icon(Icons.add),
          ),
          MainBottomAppBarIconWidget(
            label: "My Recipes",
            onPressed: () => mainProvider.changePage(2),
            iconData: Icons.task_sharp,
            isSelectedPage: mainProvider.isSelectedPage(2),
          ),
          MainBottomAppBarIconWidget(
            label: "Profile",
            onPressed: () => mainProvider.changePage(3),
            iconData: Icons.person_outline,
            isSelectedPage: mainProvider.isSelectedPage(3),
          ),
        ],
      ),
    );
  }
}
