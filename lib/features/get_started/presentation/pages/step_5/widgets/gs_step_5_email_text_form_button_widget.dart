import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/companents/buttons/app_text_fom_button.dart';
import '../states/gs_email_provider.dart';

class GSStep5EmailTextFormButtonWidget extends StatelessWidget {
  const GSStep5EmailTextFormButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GSEmailProvider viewModel = Provider.of<GSEmailProvider>(context);

    return AppTextFormButton(
      textInputAction: TextInputAction.done,
      hintText: "Email",
      onSaved: (email) {
        viewModel.saveEmail(email!);
      },
      validator: (email) {
        if (email == null || email == "") {
          return "Not Epmty";
        }
        return null;
      },
      textInputType: TextInputType.emailAddress,
    );
  }
}
