import '../../../../../../core/extensions/context_ext.dart';
import '../states/gs_step_3_form_key_provider.dart';

import '../../../../../../core/companents/cards/dietory_prefs_card.dart';
import '../../../../../../core/companents/widgets/get_started_top_widget.dart';
import '../../../../../../core/resources/sizes.dart';
import '../../../../../../core/resources/strings.dart';
import '../states/gs_dietory_prefs_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GSStep3BodyWidget extends StatelessWidget {
  const GSStep3BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GSDietoryPrefsProvider gsDietoryPrefsProvider =
        Provider.of<GSDietoryPrefsProvider>(context);
    GSStep3FormKeyProvider gsStep3FormKeyProvider =
        Provider.of<GSStep3FormKeyProvider>(context);

    return Form(
      key: gsStep3FormKeyProvider.key,
      child: FormField(
        validator: (_) {
          if (gsDietoryPrefsProvider.selectedsDietoryPrefs.isEmpty) {
            return "Is not empty";
          }
          return null;
        },
        builder: (field) {
          return Column(
            children: [
              const GetStartedTopWidget(
                title: Strings.step_3_title,
                body: Strings.step_3_body,
              ),
              if (field.hasError)
                Text(
                  field.errorText!,
                  style:
                      context.textTheme.labelLarge!.copyWith(color: Colors.red),
                ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: Sizes.s2,
                    childAspectRatio: Sizes.s3.toDouble(),
                    crossAxisSpacing: Sizes.s10.toDouble(),
                    mainAxisSpacing: Sizes.s10.toDouble(),
                  ),
                  itemCount: gsDietoryPrefsProvider.dietoryPrefs.length,
                  itemBuilder: (context, index) {
                    return DietoryPrefsCard(
                      dietoryPref: gsDietoryPrefsProvider.dietoryPrefs[index],
                      isSelected: gsDietoryPrefsProvider.isSelectedDietPrefs(
                        gsDietoryPrefsProvider.dietoryPrefs[index],
                      ),
                      onTap: () => gsDietoryPrefsProvider.setDietPref(
                          gsDietoryPrefsProvider.dietoryPrefs[index]),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
