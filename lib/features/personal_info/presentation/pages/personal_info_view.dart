import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../core/companents/buttons/app_drop_down_button.dart';
import '../../../../core/companents/buttons/app_text_fom_button.dart';
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

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = context.watch<UserProvider>();
    UserDetailProvider userDetailProvider = context.watch<UserDetailProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Info"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: context.paddingHorizMedium,
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Center(child: EPImageWidget()),
            const SizedBox(
              height: 10,
            ),
            EPTextFormFieldWidget(
              hintText: "Full Name",
              value: userProvider.user!.fullName,
            ),
            const SizedBox(
              height: 10,
            ),
            EPTextFormFieldWidget(
              hintText: "Email",
              value: userProvider.user!.email,
            ),
            const SizedBox(
              height: 10,
            ),
            EPTextFormFieldWidget(
              hintText: "Phone Number",
              value: userProvider.user!.phoneNumber,
            ),
            const SizedBox(
              height: 10,
            ),
            AppDropDownButton(
              hintText: "Gender",
              onSaved: (gender) {},
              validator: (gender) {
                if (gender == null) {
                  return "Is not empty";
                }
                return null;
              },
              value: userDetailProvider.userDetail?.gender,
            ),
            const SizedBox(
              height: 10,
            ),
            AppTextFormButton(
              width: double.infinity,
              label: "Date of Birth",
              hintText: "MM/DD/YYYY",
              suffixIcon: const Icon(
                Icons.date_range,
                color: Colors.red,
              ),
              onSaved: (dateOfBrith) {
                // viewModel.saveDateOfBirth(
                //     DateTime.parse(dateOfBrith!.replaceAll(RegExp(r'/'), "")));
              },
              validator: (dateOfBrith) {
                if (dateOfBrith == null || dateOfBrith == "") {
                  return "Not Epmty";
                }
                return null;
              },
              textInputType: TextInputType.none,
              onTap: () async {
                // viewModel.dateController.selection.end;
                // DateTime? pickedDate = await showDatePicker(
                //   context: context,
                //   initialDate: DateTime.now(),
                //   firstDate: DateTime(1923),
                //   lastDate: DateTime.now(),
                // );
                // if (pickedDate != null) {
                //   viewModel.dateController.text =
                //       DateFormat("MM/dd/yyyy").format(pickedDate);
                // }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            EPTextFormFieldWidget(
              hintText: "Street Address",
              value: userDetailProvider.userDetail!.adress,
            ),
            const SizedBox(
              height: 10,
            ),
            EPTextFormFieldWidget(
              hintText: "Country",
              value: userDetailProvider.userDetail!.country,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class EPTextFormFieldWidget extends StatefulWidget {
  const EPTextFormFieldWidget({
    super.key,
    this.validator,
    this.onSaved,
    required this.hintText,
    required this.value,
    this.maxLenght,
    this.maxLines,
    this.minLines,
  });
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final String hintText;
  final String? value;
  final int? maxLenght;
  final int? maxLines;
  final int? minLines;

  @override
  State<EPTextFormFieldWidget> createState() => _EPTextFormFieldWidgetState();
}

class _EPTextFormFieldWidgetState extends State<EPTextFormFieldWidget> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return AppTextFormButton(
          width: double.infinity,
          textEditingController: controller,
          maxLength: widget.maxLenght,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          hintText: widget.hintText,
          onSaved: widget.onSaved,
          validator: widget.validator,
        );
      },
    );
  }
}

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
