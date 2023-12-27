import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/extensions/context_ext.dart';
import '../../../../../core/resources/sizes.dart';

class CRInstructionImageFormWidget extends StatelessWidget {
  const CRInstructionImageFormWidget({
    super.key,
    this.onSaved,
    this.validator,
  });
  final void Function(File?)? onSaved;
  final String? Function(File?)? validator;
  @override
  Widget build(BuildContext context) {
    return FormField<File>(
      validator: validator,
      onSaved: onSaved,
      builder: (field) {
        return Column(
          children: [
            field.value == null
                ? _addImage(
                    context,
                    field,
                  )
                : _viewImage(context, field),
            if (field.hasError)
              Text(
                field.errorText ?? "",
                style:
                    context.textTheme.titleSmall?.copyWith(color: Colors.red),
              )
          ],
        );
      },
    );
  }

  SizedBox _addImage(BuildContext context, FormFieldState<File> field) {
    return SizedBox(
      width: context.width(Sizes.s0_2_6),
      height: context.width(Sizes.s0_2_5),
      child: Card(
        child: InkWell(
          onTap: () {
            _addCover(context, field, false);
          },
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.image), Text("Add Image")],
          ),
        ),
      ),
    );
  }

  Widget _viewImage(BuildContext context, FormFieldState<File> field) {
    return Stack(
      children: [
        Container(
          width: context.width(Sizes.s0_2_6),
          height: context.width(Sizes.s0_2_5),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: FileImage(field.value!),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            onPressed: () => _addCover(context, field, true),
            icon: const CircleAvatar(
              backgroundColor: Colors.red,
              radius: 10,
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

  _addCover(
      BuildContext context, FormFieldState<File> fieldState, bool addImage) {
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
                      fieldState.didChange(File(image.path));
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
                      fieldState.didChange(File(image.path));
                    }
                  },
                  icon: const Icon(Icons.image_outlined),
                  label: const Text("Gallery"),
                ),
                if (addImage)
                  TextButton.icon(
                    onPressed: () {
                      fieldState.didChange(null);

                      context.pop();
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
  }
}
