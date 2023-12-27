import '../../../../core/companents/buttons/app_text_fom_button.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../../core/params/user_detail_params.dart';
import '../../../../core/resources/sizes.dart';
import '../../../user_detail/presentation/states/user_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class PVTextFormFieldWidget extends StatefulWidget {
  const PVTextFormFieldWidget({
    super.key,
    this.validator,
    this.onSaved,
    required this.hintText,
    required this.value,
    required this.contentTitle,
    this.width,
  });
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final String contentTitle;
  final String hintText;
  final String? value;
  final double? width;

  @override
  State<PVTextFormFieldWidget> createState() => _PVTextFormFieldWidgetState();
}

class _PVTextFormFieldWidgetState extends State<PVTextFormFieldWidget> {
  bool enabled = false;
  late TextEditingController controller;
  late GlobalKey<FormState> formKey;
  late FocusNode focuNode;
  @override
  void initState() {
    super.initState();
    focuNode = FocusNode();
    controller = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    focuNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserDetailProvider userDetailProvider = context.watch<UserDetailProvider>();
    if (widget.value != null) {
      controller.setText(widget.value!);
    }

    return Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: widget.width ?? context.width(Sizes.s0_8),
            child: widget.value != null && widget.value != "" && !enabled
                ? Padding(
                    padding: context.paddingTopMedium,
                    child: Text(widget.value!),
                  )
                : !enabled
                    ? Padding(
                        padding: context.paddingTopMedium,
                        child: Text(widget.hintText),
                      )
                    : AppTextFormButton(
                        textEditingController: controller,
                        textInputAction: TextInputAction.newline,
                        isTextVisibility: false,
                        enabled: enabled,
                        contentPadding: EdgeInsets.zero,
                        maxLength: 180,
                        maxLines: 4,
                        minLines: 1,
                        hintText: widget.hintText,
                        onSaved: widget.onSaved,
                        validator: widget.validator,
                        focusNode: focuNode..requestFocus(),
                      ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () async {
              if (enabled) {
                if (formKey.currentState!.validate()) {
                  formKey.currentState?.save();
                  await context
                      .read<UserDetailProvider>()
                      .eitherUpdateUserDetailVoidOrFailure(
                        params: UpdateUserDetailParams(
                          userID: userDetailProvider.userDetail!.id,
                          contentTitle: widget.contentTitle,
                          contentBody: controller.text,
                        ),
                      )
                      .then((value) async {
                    await context
                        .read<UserDetailProvider>()
                        .eitherGetUserDetailVoidOrFailure(
                            params: UserDetailParams(
                                id: context
                                    .read<UserDetailProvider>()
                                    .userDetail!
                                    .id))
                        .then((value) {
                      setState(() {
                        enabled = false;
                        focuNode.unfocus();
                      });
                    });
                  });
                }
              } else {
                setState(() {
                  focuNode.requestFocus();

                  enabled = true;
                });
              }
            },
            icon: Icon(
              enabled ? Icons.done : Icons.edit,
              size: 20,
              color: enabled ? Colors.white : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
