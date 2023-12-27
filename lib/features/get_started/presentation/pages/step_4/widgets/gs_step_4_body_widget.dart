import 'package:cookpedia_foodrecipe_app/features/get_started/presentation/pages/step_4/widgets/gs_step_4_phone_text_form_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/companents/widgets/get_started_top_widget.dart';
import '../../../../../../core/extensions/context_ext.dart';
import '../../../../../../core/resources/sizes.dart';
import '../../../../../../core/resources/strings.dart';
import '../states/gs_step_4_global_key_provider.dart';
import 'gs_step_4_date_birth_button_widget.dart';
import 'gs_step_4_full_name_text_form_button_widget.dart';
import 'gs_step_4_gender_drop_down_button_widget.dart';
import 'gs_step_4_profil_image_field_widget.dart';

class GSStep4BodyWidget extends StatelessWidget {
  const GSStep4BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GSStep4FormKeyProvider viewModel =
        Provider.of<GSStep4FormKeyProvider>(context);

    return SingleChildScrollView(
      child: Form(
        key: viewModel.key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetStartedTopWidget(
              title: Strings.step_4_title,
              body: Strings.step_4_body,
              height: context.height(Sizes.s0_1_6),
            ),
            const GSStep4ProfilImageFieldWidget(),
            SizedBox(
              height: Sizes.s10.toDouble(),
            ),
            const GSStep4FullNameTextFormButtonWidget(),
            SizedBox(
              height: Sizes.s10.toDouble(),
            ),
            const GSStep4PhoneTextFromButtonWidget(),
            SizedBox(
              height: Sizes.s10.toDouble(),
            ),
            const GSStep4GenderDropDownButtonWidget(),
            SizedBox(
              height: Sizes.s10.toDouble(),
            ),
            const GSStep4DateOfBirthWidget(),
            SizedBox(
              height: Sizes.s15.toDouble(),
            ),
          ],
        ),
      ),
    );
  }
}
