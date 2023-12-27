import 'package:cookpedia_foodrecipe_app/features/get_started/presentation/pages/step_5/states/gs_confirm_password_provider.dart';

import '../../../../../../core/companents/buttons/app_text_fom_button.dart';
import '../states/gs_password_provider.dart';
import '../states/gs_password_visibility_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GSStep5PasswordTextFormButtonWidget extends StatelessWidget {
  const GSStep5PasswordTextFormButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GSPasswordProvider viewModel = Provider.of<GSPasswordProvider>(context);
    GSPasswordVisibilityPorvider passwordVisibilityPorvider =
        Provider.of<GSPasswordVisibilityPorvider>(context);
    return AppTextFormButton(
      hintText: "Password",
      onSaved: (password) {
        viewModel.savePassword(password!);
      },
      onChanged: (password) {
        viewModel.savePassword(password);
      },
      suffixIcon: IconButton(
        onPressed: () {
          passwordVisibilityPorvider.changeVisibility();
        },
        icon: Icon(
          passwordVisibilityPorvider.visibility
              ? Icons.visibility_off
              : Icons.visibility,
          color: Colors.red,
        ),
      ),
      obscureText: passwordVisibilityPorvider.visibility,
      validator: (password) {
        if (password == null || password == "") {
          return "Not Epmty";
        }
        if (password !=
            context.read<GSConfirmPasswordProvider>().confirmPassword) {
          return "Passwords do not match";
        }
        return null;
      },
      textInputType: TextInputType.visiblePassword,
    );
  }
}
