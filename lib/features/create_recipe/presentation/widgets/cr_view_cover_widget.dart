import 'dart:io';

import 'package:cookpedia_foodrecipe_app/core/params/recipe_cover_image_params.dart';
import 'package:cookpedia_foodrecipe_app/features/create_recipe/presentation/states/cr_cover_saved_provider.dart';
import 'package:cookpedia_foodrecipe_app/features/recipe_cover_image/presentation/states/recipe_cover_image_provider.dart';
import 'package:cookpedia_foodrecipe_app/features/user/presentation/states/user_provider.dart';

import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/sizes.dart';
import '../states/cr_cover_image_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CRViewCoverWidget extends StatelessWidget {
  const CRViewCoverWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    CRCoverImageProvider coverImageProvider =
        context.watch<CRCoverImageProvider>();
    return Stack(
      children: [
        Card(
          child: Container(
            width: context.width(Sizes.s0_9),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: FileImage(
                  coverImageProvider.covers[index],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: IconButton(
            onPressed: () {
              _changeCoverImage(context, coverImageProvider.covers[index]);
            },
            icon: const CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(
                Icons.change_circle,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _changeCoverImage(BuildContext context, File currentImage) {
    CRCoverImageProvider coverImageProvider =
        context.read<CRCoverImageProvider>();
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                  "Cover Image",
                  style: context.textTheme.titleMedium,
                )),
                TextButton.icon(
                  onPressed: () async {
                    context.pop();

                    XFile? image = await ImagePicker().pickImage(
                        source: ImageSource.camera,
                        maxHeight: 400,
                        maxWidth: 400,
                        imageQuality: 60);
                    if (image != null) {
                      coverImageProvider.changeCover(
                          currentImage, File(image.path));
                    }
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text("Camera"),
                ),
                TextButton.icon(
                  onPressed: () async {
                    context.pop();

                    XFile? image = await ImagePicker().pickImage(
                        source: ImageSource.gallery,
                        maxHeight: 400,
                        maxWidth: 400,
                        imageQuality: 60);
                    if (image != null) {
                      coverImageProvider.changeCover(
                          currentImage, File(image.path));
                    }
                  },
                  icon: const Icon(Icons.image_outlined),
                  label: const Text("Gallery"),
                ),
                TextButton.icon(
                  onPressed: () {
                    coverImageProvider.removeCover(currentImage);
                    context.pop();
                  },
                  icon: const Icon(Icons.delete),
                  label: const Text("remove"),
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
  }
}

class CRViewCoverFormWidget extends StatelessWidget {
  const CRViewCoverFormWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return FormField(
      onSaved: (_) async {
        var cover = context.read<CRCoverImageProvider>().covers[index];
        await context
            .read<RecipeCoverImageProvider>()
            .eitherAddRecipeCoverImage(
              params: RecipeCoverImageParams(
                  imagePath: cover,
                  userID: context.read<UserProvider>().user!.id),
            )
            .then((value) {
          value.fold((l) => null,
              (r) => context.read<CRCoverSavedProvider>().savePath(r.imageURL));
        });
      },
      builder: (field) => CRViewCoverWidget(index: index),
    );
  }
}
