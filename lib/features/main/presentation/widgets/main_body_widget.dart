import '../../../discover/presentation/pages/discover.dart';
import '../../../home/presentation/pages/home.dart';
import '../states/main_provider.dart';
import '../../../my_recipes/presentation/pages/my_recipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../profile/presentation/pages/profile_view.dart';

class MainBodyWidget extends StatelessWidget {
  const MainBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
        index: context.watch<MainProvider>().selectedPage,
        children: const [
          Home(),
          Discover(),
          MyRecipes(),
          ProfileView(),
        ]);
  }
}
