import 'package:cookpedia_foodrecipe_app/core/params/user_params.dart';
import 'package:cookpedia_foodrecipe_app/features/recipe/presentation/states/recipe_provider.dart';
import 'package:cookpedia_foodrecipe_app/features/user/presentation/states/user_provider.dart';
import 'package:cookpedia_foodrecipe_app/features/user_detail/presentation/states/user_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/strings.dart';
import '../../../auth/presentation/states/auth_provider.dart';
import '../../../main/presentation/pages/main_view.dart';
import '../../../welcome/presentation/pages/welcome_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: context.read<AuthProvider>().changedAuth(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                context.read<UserProvider>().eitherGetUserOrFailure(
                      params: UserParams(id: snapshot.data!.uid),
                      userDetailProvider: context.read<UserDetailProvider>(),
                      recipeProvider: context.read<RecipeProvider>(),
                    );
                return const MainView();
              } else {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            } else {
              return const WelcomePage();
            }
          } else {
            return Scaffold(
              appBar: AppBar(),
              body: const SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlutterLogo(
                      size: 200,
                    ),
                    Text(Strings.cookpedia),
                    CircularProgressIndicator.adaptive(
                      strokeCap: StrokeCap.round,
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
