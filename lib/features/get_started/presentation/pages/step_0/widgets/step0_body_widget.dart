import 'package:cookpedia_foodrecipe_app/features/get_started/presentation/pages/step_0/states/gs_step_0_form_key_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/companents/buttons/search_button.dart';
import '../../../../../../core/companents/cards/country_card.dart';
import '../../../../../../core/companents/widgets/get_started_top_widget.dart';
import '../../../../../../core/extensions/context_ext.dart';
import '../../../../../../core/resources/sizes.dart';
import '../../../../../../core/resources/strings.dart';
import '../states/gs_country_provider.dart';

class GSStep0BodyWidget extends StatelessWidget {
  const GSStep0BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GSCountryProvider gsCountryProvider =
        Provider.of<GSCountryProvider>(context);
    GSStep0FormKeyProvider gsStep0FormKeyProvider =
        Provider.of<GSStep0FormKeyProvider>(context);

    return Form(
        key: gsStep0FormKeyProvider.key,
        child: FormField<void>(
          validator: (_) {
            if (gsCountryProvider.selectedCountry == null) {
              return "Is Not Empty";
            }
            return null;
          },
          builder: (field) {
            return Column(
              children: [
                const GetStartedTopWidget(
                  title: Strings.step_0_title,
                  body: Strings.step_0_body,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: context.height(Sizes.s0_1),
                      child: SearchButton(
                        onChanged: (value) {},
                        hint: Strings.countryHint,
                      ),
                    ),
                    if (field.hasError)
                      Text(
                        field.errorText!,
                        style: context.textTheme.labelLarge!
                            .copyWith(color: Colors.red),
                      )
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: gsCountryProvider.countrys.length,
                    itemBuilder: (context, index) {
                      return CountryCard(
                        country: gsCountryProvider.countrys[index],
                        index: index,
                        selectedIndex: gsCountryProvider.selectedCountry,
                        onTap: () => gsCountryProvider.selectCountry(index),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ));
  }
}
