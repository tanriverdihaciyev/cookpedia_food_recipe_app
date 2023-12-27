import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_ext.dart';
import '../../../../core/params/recipe_params.dart';
import '../../../../core/resources/sizes.dart';
import '../../../recipe/presentation/states/recipe_provider.dart';
import '../../../user/presentation/states/user_provider.dart';
import '../states/mr_search_provider.dart';
import '../widgets/mr_app_bar_widget.dart';
import '../widgets/mr_body_widget.dart';

class MyRecipes extends StatelessWidget {
  const MyRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.watch<UserProvider>().user != null) {
      context.read<RecipeProvider>().eitherGetUserRecipesOrFailure(
          params: RecipeUserParams(
              sharedUserID: context.watch<UserProvider>().user!.id));
    }

    return MultiProvider(
      providers: [
        ListenableProvider(
          create: (context) => MRSearchProvider(),
        ),
      ],
      child: DefaultTabController(
        length: Sizes.s2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(
              double.infinity,
              context.height(Sizes.s0_1_5),
            ),
            child: const MRAppBarWidget(),
          ),
          body: const MRBodyWidget(),
        ),
      ),
    );
  }
}
