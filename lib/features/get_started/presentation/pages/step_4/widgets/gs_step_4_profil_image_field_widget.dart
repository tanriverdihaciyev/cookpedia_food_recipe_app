import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/companents/widgets/profil_image_widget.dart';
import '../../../../../../core/extensions/context_ext.dart';
import '../states/gs_image_path_provider.dart';

class GSStep4ProfilImageFieldWidget extends StatelessWidget {
  const GSStep4ProfilImageFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GSImagePathProvider gsImagePathProvider =
        Provider.of<GSImagePathProvider>(context);
    return FormField<File>(
      onSaved: (newValue) {
        if (newValue != null) {
          gsImagePathProvider.addImage(
            newValue,
          );
        }
      },
      builder: (field) {
        return Center(
          child: ProfilImageWidget(
            image: field.value != null
                ? FileImage(
                    field.value!,
                  )
                : null,
            onTap: () {
              _profilImageDownload(
                context,
                field,
              );
            },
          ),
        );
      },
    );
  }

  _profilImageDownload(BuildContext context, FormFieldState<File> field) async {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Profile Image",
                    style: context.textTheme.titleMedium,
                  ),
                ),
                TextButton.icon(
                  onPressed: () async {
                    context.pop();

                    XFile? image = await ImagePicker().pickImage(
                      source: ImageSource.camera,
                      maxHeight: 400,
                      maxWidth: 400,
                      imageQuality: 60,
                    );
                    if (image != null) {
                      field.didChange(
                        File(
                          image.path,
                        ),
                      );
                    }
                  },
                  icon: const Icon(
                    Icons.camera,
                  ),
                  label: const Text(
                    "Camera",
                  ),
                ),
                TextButton.icon(
                  onPressed: () async {
                    context.pop();

                    XFile? image = await ImagePicker().pickImage(
                      source: ImageSource.gallery,
                      maxHeight: 400,
                      maxWidth: 400,
                      imageQuality: 60,
                    );
                    if (image != null) {
                      field.didChange(
                        File(
                          image.path,
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.image_outlined),
                  label: const Text("Gallery"),
                ),
                if (field.value != null)
                  TextButton.icon(
                    onPressed: () async {
                      context.pop();

                      field.didChange(
                        null,
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                    ),
                    label: const Text(
                      "Remove",
                    ),
                  ),
                TextButton.icon(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.close,
                  ),
                  label: const Text(
                    "Close",
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
