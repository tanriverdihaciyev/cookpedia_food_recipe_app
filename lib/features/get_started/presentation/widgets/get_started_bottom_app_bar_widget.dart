import 'package:cookpedia_foodrecipe_app/features/get_started/presentation/pages/step_0/states/gs_step_0_form_key_provider.dart';
import 'package:cookpedia_foodrecipe_app/features/get_started/presentation/pages/step_1/states/gs_step_1_form_key_provider.dart';
import 'package:cookpedia_foodrecipe_app/features/get_started/presentation/pages/step_2/states/gs_step_2_form_key_provider.dart';
import 'package:cookpedia_foodrecipe_app/features/get_started/presentation/pages/step_3/states/gs_step_3_form_key_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/companents/buttons/red_elevation_button.dart';
import '../../../../core/params/auth_params.dart';
import '../../../../core/params/profil_image_params.dart';
import '../../../../core/resources/routes.dart';
import '../../../auth/presentation/states/auth_provider.dart';
import '../../../profil_image/presentation/states/profil_image_provider.dart';
import '../../../user/domain/entities/user_entity.dart';
import '../../../user/presentation/states/user_provider.dart';
import '../../../user_detail/domain/entities/user_detail_entity.dart';
import '../../../user_detail/presentation/states/user_detail_provider.dart';
import '../pages/step_0/states/gs_country_provider.dart';
import '../pages/step_1/states/gs_cooking_level_provider.dart';
import '../pages/step_1/states/gs_cooking_level_selected_provider.dart';
import '../pages/step_2/states/gs_food_prefrence_provider.dart';
import '../pages/step_3/states/gs_dietory_prefs_provider.dart';
import '../pages/step_4/states/gs_date_of_birth_provider.dart';
import '../pages/step_4/states/gs_full_name_provider.dart';
import '../pages/step_4/states/gs_gender_provider.dart';
import '../pages/step_4/states/gs_image_path_provider.dart';
import '../pages/step_4/states/gs_phone_number_provider.dart';
import '../pages/step_4/states/gs_step_4_global_key_provider.dart';
import '../pages/step_5/states/gs_email_provider.dart';
import '../pages/step_5/states/gs_password_provider.dart';
import '../pages/step_5/states/gs_step_5_global_key_provider.dart';
import '../pages/step_5/states/gs_user_name_provider.dart';
import '../states/get_started_loading_provider.dart';
import '../states/get_started_progress_provider.dart';
import '../states/get_started_step_provider.dart';

class GetStartedBottomAppBarWidget extends StatelessWidget {
  const GetStartedBottomAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GetStartedStepProvider stepProvider =
        context.watch<GetStartedStepProvider>();
    GSStep4FormKeyProvider gsStep4GlobayKeyProvider =
        context.watch<GSStep4FormKeyProvider>();
    GetStartedProgressProvider getStartedProgressProvider =
        context.watch<GetStartedProgressProvider>();

    return BottomAppBar(
      child: RedElevationButton(
        text: stepProvider.step == 5 ? "Sign Up" : "Continue",
        onTap: () async => await callBack(
          context,
          stepProvider,
          gsStep4GlobayKeyProvider,
          getStartedProgressProvider,
        ),
      ),
    );
  }

  Future<void> callBack(
      BuildContext context,
      GetStartedStepProvider stepProvider,
      GSStep4FormKeyProvider gsStep4GlobayKeyProvider,
      GetStartedProgressProvider getStartedProgressProvider) async {
    switch (stepProvider.step) {
      case 0:
        if (context
            .read<GSStep0FormKeyProvider>()
            .key
            .currentState!
            .validate()) {
          stepProvider.nextStep();
          getStartedProgressProvider.incrementProgress(stepProvider);
        }
        break;
      case 1:
        if (context
            .read<GSStep1FormKeyProvider>()
            .key
            .currentState!
            .validate()) {
          stepProvider.nextStep();
          getStartedProgressProvider.incrementProgress(stepProvider);
        }
        break;
      case 2:
        if (context
            .read<GSStep2FormKeyProvider>()
            .key
            .currentState!
            .validate()) {
          stepProvider.nextStep();
          getStartedProgressProvider.incrementProgress(stepProvider);
        }
        break;
      case 3:
        if (context
            .read<GSStep3FormKeyProvider>()
            .key
            .currentState!
            .validate()) {
          stepProvider.nextStep();
          getStartedProgressProvider.incrementProgress(stepProvider);
        }
        break;
      case 4:
        step4(
            gsStep4GlobayKeyProvider, getStartedProgressProvider, stepProvider);
        break;
      case 5:
        await step5(context);
        break;
      default:
        stepProvider.nextStep();
        getStartedProgressProvider.incrementProgress(stepProvider);

        break;
    }
  }

  void step4(
      GSStep4FormKeyProvider gsStep4GlobayKeyProvider,
      GetStartedProgressProvider getStartedProgressProvider,
      GetStartedStepProvider getStartedStepProvider) {
    if (gsStep4GlobayKeyProvider.key.currentState!.validate()) {
      gsStep4GlobayKeyProvider.key.currentState?.save();
      getStartedStepProvider.nextStep();
      getStartedProgressProvider.incrementProgress(getStartedStepProvider);
    }
  }

  Future<void> step5(BuildContext context) async {
    if (context.read<GSStep5FormKeyProvider>().key.currentState!.validate()) {
      context.read<GSStep5FormKeyProvider>().key.currentState!.save();
      context.read<GetStartedLoadingProvider>().changeLoading();
      await signUp(context);
    }
  }

  Future<void> signUp(BuildContext context) async {
    await context
        .read<AuthProvider>()
        .eitherSignUpEmailAuthOrFailure(
          params: AuthParams(
            email: context.read<GSEmailProvider>().email!,
            password: context.read<GSPasswordProvider>().password!,
          ),
        )
        .then((value) async {
      await createUserOrError(context);
    });
  }

  Future<void> createUserOrError(BuildContext context) async {
    AuthProvider authProvider = context.read<AuthProvider>();

    if (authProvider.auth != null) {
      await authNotNull(context);
    } else if (authProvider.failure != null) {
      onError(context);
    }
  }

  void onError(BuildContext context) {
    context.read<GetStartedLoadingProvider>().changeLoading();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.read<AuthProvider>().failure!.message),
      ),
    );
  }

  Future<void> authNotNull(BuildContext context) async {
    GSImagePathProvider gsImagePathProvider =
        context.read<GSImagePathProvider>();
    if (gsImagePathProvider.imagePath != null) {
      await profilImageNotNull(context);
    } else {
      await profilImageIsNull(context);
    }
  }

  Future<void> profilImageIsNull(BuildContext context) async {
    await createUser(context);
  }

  Future<void> profilImageNotNull(BuildContext context) async {
    AuthProvider authProvider = context.read<AuthProvider>();

    GSImagePathProvider gsImagePathProvider =
        context.read<GSImagePathProvider>();
    ProfilImageProvider profilImageProvider =
        context.read<ProfilImageProvider>();
    await profilImageProvider
        .eitherAddProfilImage(
      params: AddProfilImageParams(
        userID: authProvider.auth!.id,
        profilImagePath: gsImagePathProvider.imagePath!,
      ),
    )
        .then((_) async {
      await createUser(context);
    });
  }

  Future<void> createUser(BuildContext context) async {
    AuthProvider authProvider = context.read<AuthProvider>();

    UserProvider userProvider = context.read<UserProvider>();

    ProfilImageProvider profilImageProvider =
        context.read<ProfilImageProvider>();
    await userProvider
        .eitherCreateUserOrFailure(
      params: UserEntity(
        id: authProvider.auth!.id,
        email: authProvider.auth!.email,
        fullName: context.read<GSFullNameProvider>().fullName,
        phoneNumber:
            context.read<GSPhoneNumberProvider>().phoneNumber.toString(),
        profileImage: profilImageProvider.profilImageEntity?.profilImageUrl,
        userName: context.read<GSUserNameProvider>().username,
      ),
    )
        .then((value) async {
      await createUserDetail(context);
    });
  }

  Future<void> createUserDetail(BuildContext context) async {
    AuthProvider authProvider = context.read<AuthProvider>();

    UserDetailProvider userDetailProvider = context.read<UserDetailProvider>();

    await userDetailProvider
        .eitherCreateUserDetailVoidOrFailure(
      params: UserDetailEntity(
        id: authProvider.auth!.id,
        country: context.read<GSCountryProvider>().countryModel!.longName,
        cookingLevel: context
            .read<GSCookingLevelProvider>()
            .cookingLevelModel(
                context.read<GSCookingLevelSelectedProvider>().selectedLevel!)!
            .title,
        gender: context.read<GSGenderProvider>().gender!,
        dateOfBirth: context.read<GSDateOfBirthProvider>().dateOfBirth!,
        cuisinesPrefs: context
            .read<GSFoodPrefrenceProvider>()
            .selectedsFoodPrefs
            .map((e) => e.name)
            .toSet(),
        diotaryPrefs: context
            .read<GSDietoryPrefsProvider>()
            .selectedsDietoryPrefs
            .map((e) => e.title)
            .toSet(),
      ),
    )
        .then((value) {
      resetAllgoSplash(context);
    });
  }

  void resetAllgoSplash(BuildContext context) {
    context.read<GetStartedLoadingProvider>().changeLoading();

    context.read<GSCountryProvider>().resetCountry();
    context.read<GSCookingLevelSelectedProvider>().resetLevel();
    context.read<GSFoodPrefrenceProvider>().resetFoodPrefs();
    context.read<GSDietoryPrefsProvider>().resetDietPrefs();
    context.read<GSDateOfBirthProvider>().resetDate();
    context.read<GSStep0FormKeyProvider>().key.currentState!.reset();
    context.read<GSStep1FormKeyProvider>().key.currentState!.reset();
    context.read<GSStep2FormKeyProvider>().key.currentState!.reset();
    context.read<GSStep3FormKeyProvider>().key.currentState!.reset();
    context.read<GSStep4FormKeyProvider>().key.currentState!.reset();
    context.read<GSStep5FormKeyProvider>().key.currentState!.reset();

    context.read<GSImagePathProvider>().removeImage();
    context.read<GetStartedStepProvider>().resetStep();
    context.read<GetStartedProgressProvider>().resetProgress();
    context.go(Routes.splashRoute);
  }
}
