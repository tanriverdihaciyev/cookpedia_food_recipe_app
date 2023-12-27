import 'package:cookpedia_foodrecipe_app/features/search/presentation/pages/search.dart';
import 'package:cookpedia_foodrecipe_app/features/user/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/create_recipe/presentation/pages/create_recipe.dart';
import '../../features/discover/presentation/pages/most_popular.dart';
import '../../features/discover/presentation/pages/most_searches.dart';
import '../../features/discover/presentation/pages/new_recipes.dart';
import '../../features/discover/presentation/pages/our_recommend.dart';
import '../../features/discover/presentation/pages/top_chefs.dart';
import '../../features/edit_profile/presentation/pages/edit_profile_page.dart';
import '../../features/forgot_password/presentation/pages/forgot_password_view.dart';
import '../../features/get_started/presentation/pages/get_started_view.dart';
import '../../features/other_profile/presentation/pages/other_provile_view.dart';
import '../../features/personal_info/presentation/pages/personal_info_view.dart';
import '../../features/recipe_view/presentation/pages/recipe_view_page.dart';
import '../../features/settings/presentation/pages/settings_view.dart';
import '../../features/sign_in/presentation/pages/sign_in_view.dart';
import '../../features/splash/presentation/pages/splash_view.dart';

class RoutesName {
  static const String getStartedRoute = "getStarted";
  static const String splashRoute = "/";
  static const String createRecipeRoute = "createRecipe";
  static const String recipeViewRoute = "recipeView";

  static const String signInRoute = "signIn";
  static const String editProfileRoute = "editProfile";
  static const String forgotPasswordRoute = "forgotPassword";
  static const String settingsRoute = "settings";
  static const String personalInfoRoute = "personalInfo";
  static const String mostPopularRoute = "mostPopular";
  static const String topChefsRoute = "topChefs";
  static const String ourRecommendRoute = "ourRecommend";
  static const String newRecipesRoute = "newRecipes";
  static const String mostSearchesRoute = "mostSearches";
  static const String profileRoute = "profile";
  static const String searchRoute = "search";
}

class Routes {
  static const String getStartedRoute = "/getStarted";
  static const String splashRoute = "/";
  static const String createRecipeRoute = "/createRecipe";
  static const String recipeViewRoute = "/recipeView";
  static const String editProfileRoute = "/editProfile";

  static const String signInRoute = "/signIn";
  static const String forgotPasswordRoute = "/signIn/forgotPassword";
  static const String settingsRoute = "/settings";
  static const String personalInfoRoute = "/settings/personalInfo";
  static const String mostPopularRoute = "/mostPopular";
  static const String topChefsRoute = "/topChefs";
  static const String ourRecommendRoute = "/ourRecommend";
  static const String newRecipesRoute = "/newRecipes";
  static const String mostSearchesRoute = "/mostSearches";
  static const String profileRoute = "/profile";
  static const String searchRoute = "/search";
}

class RouteManager {
  final GoRouter router = GoRouter(
    errorBuilder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.go(Routes.splashRoute);
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: const Center(
          child: Text("Not exist Page"),
        ),
      );
    },
    routes: <RouteBase>[
      GoRoute(
        path: RoutesName.splashRoute,
        builder: (context, state) => const SplashView(),
        routes: [
          GoRoute(
              path: RoutesName.signInRoute,
              builder: (context, state) => const SignInView(),
              routes: [
                GoRoute(
                  path: RoutesName.forgotPasswordRoute,
                  builder: (context, state) => const ForgotPasswordView(),
                ),
              ]),
          GoRoute(
            path: RoutesName.getStartedRoute,
            builder: (context, state) => const GetStartedView(),
          ),
          GoRoute(
            path: RoutesName.editProfileRoute,
            builder: (context, state) => const EditProfilePage(),
          ),
          GoRoute(
            path: RoutesName.recipeViewRoute,
            builder: (context, state) => const RecipeViewPage(),
          ),
          GoRoute(
            path: RoutesName.createRecipeRoute,
            builder: (context, state) => const CreateRecipePage(),
          ),
          GoRoute(
            path: RoutesName.settingsRoute,
            builder: (context, state) => const SettingsView(),
            routes: [
              GoRoute(
                path: RoutesName.personalInfoRoute,
                builder: (context, state) => const PersonalInfoView(),
              ),
            ],
          ),
          GoRoute(
            path: RoutesName.mostPopularRoute,
            builder: (context, state) => const MostPopularView(),
          ),
          GoRoute(
            path: RoutesName.topChefsRoute,
            builder: (context, state) => const TopChefsView(),
          ),
          GoRoute(
            path: RoutesName.ourRecommendRoute,
            builder: (context, state) => const OurRecommendView(),
          ),
          GoRoute(
            path: RoutesName.mostSearchesRoute,
            builder: (context, state) => const MostSearchesView(),
          ),
          GoRoute(
            path: RoutesName.newRecipesRoute,
            builder: (context, state) => const NewRecipesView(),
          ),
          GoRoute(
            path: RoutesName.profileRoute,
            builder: (context, state) =>
                OtherProfileView(userEntity: state.extra as UserEntity),
          ),
          GoRoute(
            path: RoutesName.searchRoute,
            builder: (context, state) => const SearchView(),
          ),
        ],
      ),
    ],
  );
}
