import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/companents/buttons/app_text_fom_button.dart';
import '../states/gs_phone_number_provider.dart';

class GSStep4PhoneTextFromButtonWidget extends StatelessWidget {
  const GSStep4PhoneTextFromButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GSPhoneNumberProvider viewModel =
        Provider.of<GSPhoneNumberProvider>(context);

    return AppTextFormButton(
      textInputAction: TextInputAction.done,
      hintText: "Phone Number",
      onSaved: (phoneNumber) {
        viewModel.savePhoneNumber(int.parse(phoneNumber!));
      },
      validator: (phoneNumber) {
        if (phoneNumber == null || phoneNumber == "") {
          return "Not Epmty";
        }
        return null;
      },
      textInputType: TextInputType.number,
    );
  }
}
