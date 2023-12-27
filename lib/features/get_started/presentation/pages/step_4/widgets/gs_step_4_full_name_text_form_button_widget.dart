import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/companents/buttons/app_text_fom_button.dart';
import '../states/gs_full_name_provider.dart';

class GSStep4FullNameTextFormButtonWidget extends StatelessWidget {
  const GSStep4FullNameTextFormButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GSFullNameProvider viewModel = Provider.of<GSFullNameProvider>(context);

    return AppTextFormButton(
      hintText: "Full Name",
      onSaved: (fullName) {
        viewModel.saveFullName(fullName!);
      },
      validator: (fullName) {
        if (fullName == null || fullName == "") {
          return "Not Empty";
        }
        return null;
      },
      textInputAction: TextInputAction.done,
    );
  }
}
