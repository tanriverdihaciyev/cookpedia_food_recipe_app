import 'dart:io';

import '../../../../core/constants/user_constants.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../../core/params/profil_image_params.dart';
import '../../../../core/params/user_params.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/sizes.dart';
import '../../../profil_image/presentation/states/profil_image_provider.dart';
import '../../../recipe/presentation/states/recipe_provider.dart';
import '../../../user/presentation/states/user_provider.dart';
import '../../../user_detail/presentation/states/user_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EPImageWidget extends StatelessWidget {
  const EPImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = context.watch<UserProvider>();

    return Stack(
      children: [
        Container(
          width: context.width(Sizes.s0_2_5),
          height: context.width(Sizes.s0_2_5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              context.width(Sizes.s0_2_5),
            ),
            image: DecorationImage(
                image: userProvider.user?.profileImage != null
                    ? NetworkImage(userProvider.user!.profileImage!)
                    : AssetImage(AssetsPaths.chef.imageToPath)
                        as ImageProvider),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: () async {
              showDialog(
                context: context,
                builder: (context) {
                  ProfilImageProvider profilImageProvider =
                      context.read<ProfilImageProvider>();
                  return Dialog(
                    child: Padding(
                      padding: context.paddingAllMedium,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(child: Text("Edit Profil Image")),
                          TextButton.icon(
                            onPressed: () async {
                              await ImagePicker()
                                  .pickImage(source: ImageSource.camera)
                                  .then((value) async {
                                if (value != null) {
                                  if (userProvider.user?.profileImage != null) {
                                    await profilImageProvider
                                        .eitherChangeProfilImage(
                                      params: ChangeProfilImageParams(
                                        userID: userProvider.user!.id,
                                        profilImageUrl:
                                            userProvider.user!.profileImage!,
                                        profilImagePath: File(value.path),
                                      ),
                                    )
                                        .then((_) async {
                                      if (profilImageProvider
                                              .profilImageEntity !=
                                          null) {
                                        userProvider
                                            .eitherUpdateUserOrFailure(
                                              params: UpdateUserParams(
                                                userID: userProvider.user!.id,
                                                contentTitle: kProfileImage,
                                                contentBody: profilImageProvider
                                                    .profilImageEntity!
                                                    .profilImageUrl,
                                              ),
                                            )
                                            .then(
                                              (value) => userProvider
                                                  .eitherGetUserOrFailure(
                                                    params: UserParams(
                                                        id: userProvider
                                                            .user!.id),
                                                    userDetailProvider:
                                                        context.read<
                                                            UserDetailProvider>(),
                                                    recipeProvider: context
                                                        .read<RecipeProvider>(),
                                                  )
                                                  .then(
                                                      (value) => context.pop()),
                                            );
                                      }
                                    });
                                  } else {
                                    await profilImageProvider
                                        .eitherAddProfilImage(
                                      params: AddProfilImageParams(
                                        userID: userProvider.user!.id,
                                        profilImagePath: File(value.path),
                                      ),
                                    )
                                        .then((_) async {
                                      if (profilImageProvider
                                              .profilImageEntity !=
                                          null) {
                                        userProvider
                                            .eitherUpdateUserOrFailure(
                                              params: UpdateUserParams(
                                                userID: userProvider.user!.id,
                                                contentTitle: kProfileImage,
                                                contentBody: profilImageProvider
                                                    .profilImageEntity!
                                                    .profilImageUrl,
                                              ),
                                            )
                                            .then(
                                              (value) => userProvider
                                                  .eitherGetUserOrFailure(
                                                    params: UserParams(
                                                        id: userProvider
                                                            .user!.id),
                                                    userDetailProvider:
                                                        context.read<
                                                            UserDetailProvider>(),
                                                    recipeProvider: context
                                                        .read<RecipeProvider>(),
                                                  )
                                                  .then(
                                                      (value) => context.pop()),
                                            );
                                      }
                                    });
                                  }
                                }
                              });
                            },
                            icon: const Icon(Icons.camera_alt),
                            label: const Text("Camera"),
                          ),
                          TextButton.icon(
                            onPressed: () async {
                              await ImagePicker()
                                  .pickImage(source: ImageSource.gallery)
                                  .then((value) async {
                                if (value != null) {
                                  if (userProvider.user?.profileImage != null) {
                                    await profilImageProvider
                                        .eitherChangeProfilImage(
                                      params: ChangeProfilImageParams(
                                        userID: userProvider.user!.id,
                                        profilImageUrl:
                                            userProvider.user!.profileImage!,
                                        profilImagePath: File(value.path),
                                      ),
                                    )
                                        .then((_) async {
                                      if (profilImageProvider
                                              .profilImageEntity !=
                                          null) {
                                        userProvider
                                            .eitherUpdateUserOrFailure(
                                              params: UpdateUserParams(
                                                userID: userProvider.user!.id,
                                                contentTitle: kProfileImage,
                                                contentBody: profilImageProvider
                                                    .profilImageEntity!
                                                    .profilImageUrl,
                                              ),
                                            )
                                            .then(
                                              (value) => userProvider
                                                  .eitherGetUserOrFailure(
                                                    params: UserParams(
                                                        id: userProvider
                                                            .user!.id),
                                                    userDetailProvider:
                                                        context.read<
                                                            UserDetailProvider>(),
                                                    recipeProvider: context
                                                        .read<RecipeProvider>(),
                                                  )
                                                  .then(
                                                      (value) => context.pop()),
                                            );
                                      }
                                    });
                                  } else {
                                    await profilImageProvider
                                        .eitherAddProfilImage(
                                      params: AddProfilImageParams(
                                        userID: userProvider.user!.id,
                                        profilImagePath: File(value.path),
                                      ),
                                    )
                                        .then((_) async {
                                      if (profilImageProvider
                                              .profilImageEntity !=
                                          null) {
                                        userProvider
                                            .eitherUpdateUserOrFailure(
                                              params: UpdateUserParams(
                                                userID: userProvider.user!.id,
                                                contentTitle: kProfileImage,
                                                contentBody: profilImageProvider
                                                    .profilImageEntity!
                                                    .profilImageUrl,
                                              ),
                                            )
                                            .then(
                                              (value) => userProvider
                                                  .eitherGetUserOrFailure(
                                                    params: UserParams(
                                                        id: userProvider
                                                            .user!.id),
                                                    userDetailProvider:
                                                        context.read<
                                                            UserDetailProvider>(),
                                                    recipeProvider: context
                                                        .read<RecipeProvider>(),
                                                  )
                                                  .then(
                                                      (value) => context.pop()),
                                            );
                                      }
                                    });
                                  }
                                }
                              });
                            },
                            icon: const Icon(Icons.image),
                            label: const Text("Galery"),
                          ),
                          if (userProvider.user?.profileImage != null)
                            TextButton.icon(
                              onPressed: () async {
                                await profilImageProvider
                                    .eitherDeleteProfilImage(
                                      params: DeleteProfilImageParams(
                                          userID: userProvider.user!.id,
                                          profilImageUrl:
                                              userProvider.user!.profileImage!),
                                    )
                                    .then((value) => userProvider
                                        .eitherUpdateUserOrFailure(
                                          params: UpdateUserParams(
                                            userID: userProvider.user!.id,
                                            contentTitle: kProfileImage,
                                            contentBody: null,
                                          ),
                                        )
                                        .then(
                                          (value) => userProvider
                                              .eitherGetUserOrFailure(
                                                params: UserParams(
                                                    id: userProvider.user!.id),
                                                userDetailProvider: context
                                                    .read<UserDetailProvider>(),
                                                recipeProvider: context
                                                    .read<RecipeProvider>(),
                                              )
                                              .then((value) => context.pop()),
                                        ));
                              },
                              icon: const Icon(Icons.delete),
                              label: const Text("Remove"),
                            ),
                          TextButton.icon(
                            onPressed: () {
                              context.pop();
                            },
                            icon: const Icon(Icons.close),
                            label: const Text("Close"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                Icons.edit,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
