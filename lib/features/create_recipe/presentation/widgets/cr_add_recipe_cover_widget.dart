import 'dart:io';

import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/sizes.dart';
import '../states/cr_cover_image_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CRAddRecipeCoverWidget extends StatefulWidget {
  const CRAddRecipeCoverWidget({
    super.key,
  });

  @override
  State<CRAddRecipeCoverWidget> createState() => _CRAddRecipeCoverWidgetState();
}

class _CRAddRecipeCoverWidgetState extends State<CRAddRecipeCoverWidget>
    with AutomaticKeepAliveClientMixin<CRAddRecipeCoverWidget> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FormField<File>(
      validator: (value) {
        if (context.read<CRCoverImageProvider>().covers.isEmpty) {
          return "Is Not Cover Image";
        }
        return null;
      },
      onSaved: (newValue) {},
      builder: (field) {
        return Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Stack(
            children: [
              SizedBox(
                width: context.width(Sizes.s0_9),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    side: BorderSide(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  child: InkWell(
                    onTap: () => _showImageDialog(context),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          size: 50,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Add recipe cover image "),
                      ],
                    ),
                  ),
                ),
              ),
              if (field.hasError)
                Positioned(
                  bottom: 10,
                  left: 40,
                  child: Text(
                    field.errorText ?? "",
                    style: context.textTheme.titleLarge
                        ?.copyWith(color: Colors.red),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void _showImageDialog(BuildContext context) {
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
                  ),
                ),
                TextButton.icon(
                  onPressed: () async {
                    context.pop();

                    XFile? image = await ImagePicker().pickImage(
                        source: ImageSource.camera,
                        maxHeight: 400,
                        maxWidth: 400,
                        imageQuality: 60);
                    if (image != null) {
                      coverImageProvider.addCover(File(image.path));
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
                      coverImageProvider.addCover(File(image.path));
                    }
                  },
                  icon: const Icon(Icons.image_outlined),
                  label: const Text("Gallery"),
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

  @override
  bool get wantKeepAlive => true;
}
