import 'package:cookpedia_foodrecipe_app/features/user_visit/presentation/states/user_visit_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/app.dart';
import 'features/app_snack_bar/states/app_snack_bar_provider.dart';
import 'features/auth/presentation/states/auth_provider.dart';
import 'features/comment/presentation/states/comment_provider.dart';
import 'features/create_recipe/presentation/states/cr_recipe_entity_provider.dart';
import 'features/follow/presentation/states/follow_provider.dart';
import 'features/get_started/presentation/pages/step_0/states/gs_country_provider.dart';
import 'features/get_started/presentation/pages/step_1/states/gs_cooking_level_provider.dart';
import 'features/get_started/presentation/pages/step_1/states/gs_cooking_level_selected_provider.dart';
import 'features/get_started/presentation/pages/step_2/states/gs_food_prefrence_provider.dart';
import 'features/get_started/presentation/pages/step_3/states/gs_dietory_prefs_provider.dart';
import 'features/get_started/presentation/pages/step_4/states/gs_date_of_birth_provider.dart';
import 'features/get_started/presentation/pages/step_4/states/gs_full_name_provider.dart';
import 'features/get_started/presentation/pages/step_4/states/gs_gender_provider.dart';
import 'features/get_started/presentation/pages/step_4/states/gs_image_path_provider.dart';
import 'features/get_started/presentation/pages/step_4/states/gs_phone_number_provider.dart';
import 'features/get_started/presentation/pages/step_5/states/gs_email_provider.dart';
import 'features/get_started/presentation/pages/step_5/states/gs_password_provider.dart';
import 'features/get_started/presentation/pages/step_5/states/gs_user_name_provider.dart';
import 'features/get_started/presentation/states/get_started_loading_provider.dart';
import 'features/get_started/presentation/states/get_started_progress_provider.dart';
import 'features/get_started/presentation/states/get_started_step_provider.dart';
import 'features/main/presentation/states/main_provider.dart';
import 'features/profil_image/presentation/states/profil_image_provider.dart';
import 'features/recipe/presentation/states/recipe_provider.dart';
import 'features/recipe_view/presentation/states/recipe_view_provider.dart';
import 'features/recipe_visit/presentation/states/recipe_visit_provider.dart';
import 'features/saved_recipes/presentation/states/saved_recipe_provider.dart';
import 'features/sign_in/presentation/states/si_email_or_user_name_provider.dart';
import 'features/sign_in/presentation/states/si_form_key_provider.dart';
import 'features/sign_in/presentation/states/si_loading_provider.dart';
import 'features/sign_in/presentation/states/si_password_provider.dart';
import 'features/sign_in/presentation/states/si_remember_provider.dart';
import 'features/sign_in/presentation/states/si_visibility_provider.dart';
import 'features/user/presentation/states/user_provider.dart';
import 'features/user_detail/presentation/states/user_detail_provider.dart';
import 'firebase_options.dart';
import 'intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initilazieDependency();
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider(
          create: (context) => UserVisitProvider(),
        ),
        ListenableProvider(
          create: (context) => RecipeVisitProvider(),
        ),
        ListenableProvider(
          create: (context) => MainProvider(),
        ),
        ListenableProvider(
          create: (context) => AuthProvider(),
        ),
        ListenableProvider(
          create: (context) => UserProvider(),
        ),
        ListenableProvider(
          create: (context) => UserDetailProvider(),
        ),
        ListenableProvider(
          create: (context) => RecipeProvider(),
        ),
        ListenableProvider(
          create: (context) => FollowProvider(),
        ),
        ListenableProvider(
          create: (context) => GetStartedProgressProvider(),
        ),
        ListenableProvider(
          create: (context) => GetStartedLoadingProvider(),
        ),
        ListenableProvider(
          create: (context) => GetStartedStepProvider(),
        ),
        ListenableProvider(
          create: (context) => SIFormKeyProvider(),
        ),
        ListenableProvider(
          create: (context) => SIEmailOrUserNameProvider(),
        ),
        ListenableProvider(
          create: (context) => SIPasswordProvider(),
        ),
        ListenableProvider(
          create: (context) => SILoadingProvider(),
        ),
        ListenableProvider(
          create: (context) => SIVisibilityProvider(),
        ),
        ListenableProvider(
          create: (context) => SIRememberProvider(),
        ),
        ListenableProvider(
          create: (context) => RecipeViewProvider(),
        ),
        ListenableProvider(
          create: (context) => CommentProvider(),
        ),
        ListenableProvider(
          create: (context) => SavedRecipeProvider(),
        ),
        ListenableProvider(
          create: (context) => CRRecipeEntityProvider(),
        ),
        ListenableProvider(
          create: (context) => AppSnackBarProvider(),
        ),
        ListenableProvider(
          create: (context) => ProfilImageProvider(),
        ),
        ListenableProvider(
          create: (context) => GSDateOfBirthProvider(),
        ),
        ListenableProvider(
          create: (context) => GSFoodPrefrenceProvider(),
        ),
        ListenableProvider(
          create: (context) => GSDietoryPrefsProvider(),
        ),
        ListenableProvider(
          create: (context) => GSFullNameProvider(),
        ),
        ListenableProvider(
          create: (context) => GSGenderProvider(),
        ),
        ListenableProvider(
          create: (context) => GSPhoneNumberProvider(),
        ),
        ListenableProvider(
          create: (context) => GSPasswordProvider(),
        ),
        ListenableProvider(
          create: (context) => GSEmailProvider(),
        ),
        ListenableProvider(
          create: (context) => GSImagePathProvider(),
        ),
        ListenableProvider(
          create: (context) => GSUserNameProvider(),
        ),
        ListenableProvider(
          create: (context) => GSCountryProvider(),
        ),
        ListenableProvider(
          create: (context) => GSCookingLevelProvider(),
        ),
        ListenableProvider(
          create: (context) => GSCookingLevelSelectedProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
