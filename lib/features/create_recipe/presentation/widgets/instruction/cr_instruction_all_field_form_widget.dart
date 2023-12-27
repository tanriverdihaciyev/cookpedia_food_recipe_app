// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/params/recipe_instruction_image_params.dart';
import '../../../../recipe/domain/entities/recipe_entity.dart';
import '../../../../recipe_instruction_image/presentation/states/recipe_instruction_image_provider.dart';
import '../../../../user/presentation/states/user_provider.dart';
import '../../states/instruction/cr_instruction_all_field_provider.dart';
import '../../states/instruction/cr_instruction_entitys_provider.dart';
import 'cr_instruction_tile_images_widget.dart';
import 'cr_instruction_tile_text_form_widget.dart';

class CRInstructionAllFieldFormWidget extends StatefulWidget {
  const CRInstructionAllFieldFormWidget(
      {super.key, required this.index, required this.formKey});
  final int index;
  final GlobalKey<FormState> formKey;

  @override
  State<CRInstructionAllFieldFormWidget> createState() =>
      _CRInstructionAllFieldFormWidgetState();
}

class _CRInstructionAllFieldFormWidgetState
    extends State<CRInstructionAllFieldFormWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FormField<void>(
      onSaved: (_) {
        _onSaved(context, widget.index);
      },
      validator: (_) {
        return _validator(context, widget.index);
      },
      builder: (field) {
        return Form(
          key: widget.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _textform(context, widget.index),
              _images(context, widget.index),
              if (field.hasError) Text(field.errorText!)
            ],
          ),
        );
      },
    );
  }

  void _onSaved(BuildContext context, int index) async {
    var param = context.read<CRInstructionAllFieldProvider>().getParams(index);
    var userID = context.read<UserProvider>().user!.id;
    var recipInstructionImageProvider =
        context.read<RecipeInstructionImageProvider>();
    String? image1 = await recipInstructionImageProvider
        .eitherAddRecipeInstructionImage(
            params: RecipeInstructionImageParams(
                instructionImage: param!.image1!, userID: userID))
        .then((value) {
      return value.fold((l) => null, (r) => r.instructionImageURL);
    });
    String? image2 = await recipInstructionImageProvider
        .eitherAddRecipeInstructionImage(
            params: RecipeInstructionImageParams(
                instructionImage: param.image2!, userID: userID))
        .then((value) {
      return value.fold((l) => null, (r) => r.instructionImageURL);
    });
    String? image3 = await recipInstructionImageProvider
        .eitherAddRecipeInstructionImage(
            params: RecipeInstructionImageParams(
                instructionImage: param.image3!, userID: userID))
        .then((value) {
      return value.fold((l) => null, (r) => r.instructionImageURL);
    });

    context.read<CRInstructionEntitysProvider>().addInstruction(
          InstructionEntity(
            id: param.index!,
            instruction: param.instruction!,
            image1: image1!,
            image2: image2!,
            image3: image3!,
          ),
        );
  }

  String? _validator(BuildContext context, index) {
    CRInsturctionAllFieldParams? data =
        context.read<CRInstructionAllFieldProvider>().getParams(index);

    if (data?.instruction == null ||
        data?.instruction == "" ||
        data?.image1 == null ||
        data?.image2 == null ||
        data?.image3 == null) {
      return "Is Not Empty";
    }
    return null;
  }

  CRInstructionTileImagesWidget _images(BuildContext context, int index) {
    return CRInstructionTileImagesWidget(
      onSaved1: (p0) =>
          context.read<CRInstructionAllFieldProvider>().saveImage1(p0, index),
      validator1: (p0) {
        if (p0 == null) {
          return "Is Not Empty";
        }
        return null;
      },
      onSaved2: (p0) =>
          context.read<CRInstructionAllFieldProvider>().saveImage2(p0, index),
      validator2: (p0) {
        if (p0 == null) {
          return "Is Not Empty";
        }
        return null;
      },
      onSaved3: (p0) =>
          context.read<CRInstructionAllFieldProvider>().saveImage3(p0, index),
      validator3: (p0) {
        if (p0 == null) {
          return "Is Not Empty";
        }
        return null;
      },
    );
  }

  CRInstructionTileTextFormWidget _textform(BuildContext context, int index) {
    return CRInstructionTileTextFormWidget(
      index: widget.index,
      onSaved: (p0) =>
          context.read<CRInstructionAllFieldProvider>().saveInstruct(p0, index),
      validator: (value) {
        if (value == null || value == "") {
          return "Is Not Empty";
        }
        return null;
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
