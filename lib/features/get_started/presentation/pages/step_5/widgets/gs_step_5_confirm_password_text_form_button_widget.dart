import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/companents/buttons/app_text_fom_button.dart';
import '../states/gs_confirm_password_provider.dart';
import '../states/gs_confirm_password_visibility_provider.dart';
import '../states/gs_password_provider.dart';

class GSStep5ConfirmPasswordTextFormButtonWidget extends StatelessWidget {
  const GSStep5ConfirmPasswordTextFormButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GSConfirmPasswordProvider viewModel =
        Provider.of<GSConfirmPasswordProvider>(context);
    GSConfirmPasswordVisibilityPorvider confirmPasswordVisibilityPorvider =
        Provider.of<GSConfirmPasswordVisibilityPorvider>(context);

    return AppTextFormButton(
      hintText: "Confirm Password",
      onSaved: (confirmPassword) {
        viewModel.saveConfirmPassword(confirmPassword!);
      },
      onChanged: (confirmPassword) {
        viewModel.saveConfirmPassword(confirmPassword);
      },
      suffixIcon: IconButton(
        onPressed: () {
          confirmPasswordVisibilityPorvider.changeConfirmPasswordVisibility();
        },
        icon: Icon(
          confirmPasswordVisibilityPorvider.confirmPasswordVisibility
              ? Icons.visibility_off
              : Icons.visibility,
          color: Colors.red,
        ),
      ),
      obscureText: confirmPasswordVisibilityPorvider.confirmPasswordVisibility,
      validator: (confirmPassword) {
        if (confirmPassword == null || confirmPassword == "") {
          return "Not Empty";
        }
        if (confirmPassword != context.read<GSPasswordProvider>().password) {
          return "Passwords do not match";
        }
        return null;
      },
      textInputType: TextInputType.visiblePassword,
    );
  }
}
