import 'package:cookpedia_foodrecipe_app/features/get_started/presentation/pages/step_4/states/gs_date_of_birth_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/companents/buttons/app_text_fom_button.dart';

class GSStep4DateOfBirthWidget extends StatelessWidget {
  const GSStep4DateOfBirthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GSDateOfBirthProvider viewModel =
        Provider.of<GSDateOfBirthProvider>(context);

    return AppTextFormButton(
      textEditingController: viewModel.dateController,
      label: "Date of Birth",
      hintText: "MM/DD/YYYY",
      suffixIcon: const Icon(
        Icons.date_range,
        color: Colors.red,
      ),
      onSaved: (dateOfBrith) {
        viewModel.saveDateOfBirth(
            DateTime.parse(dateOfBrith!.replaceAll(RegExp(r'/'), "")));
      },
      validator: (dateOfBrith) {
        if (dateOfBrith == null || dateOfBrith == "") {
          return "Not Epmty";
        }
        return null;
      },
      textInputType: TextInputType.none,
      onTap: () async {
        viewModel.dateController.selection.end;
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1923),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          viewModel.dateController.text =
              DateFormat("MM/dd/yyyy").format(pickedDate);
        }
      },
    );
  }
}
