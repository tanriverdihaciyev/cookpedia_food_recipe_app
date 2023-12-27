import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/companents/buttons/app_text_fom_button.dart';
import '../states/gs_user_name_provider.dart';

class GSStep5UsernameTextFormButtonWidget extends StatelessWidget {
  const GSStep5UsernameTextFormButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GSUserNameProvider viewModel = Provider.of<GSUserNameProvider>(context);

    return AppTextFormButton(
      hintText: "Username",
      textInputAction: TextInputAction.done,
      onSaved: (username) {
        viewModel.saveUserName(username!);
      },
      validator: (username) {
        if (username == null || username == "") {
          return "Not Empty";
        }
        return null;
      },
    );
  }
}
