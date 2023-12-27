import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/companents/buttons/app_drop_down_button.dart';
import '../states/gs_gender_provider.dart';

class GSStep4GenderDropDownButtonWidget extends StatelessWidget {
  const GSStep4GenderDropDownButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GSGenderProvider viewModel = Provider.of<GSGenderProvider>(context);

    return AppDropDownButton(
      hintText: "Gender",
      onSaved: (gender) {
        if (gender != null) {
          viewModel.saveGender(gender);
        }
      },
      validator: (gender) {
        if (gender == null || gender == "") {
          return "Not Epmty";
        }
        return null;
      },
    );
  }
}
