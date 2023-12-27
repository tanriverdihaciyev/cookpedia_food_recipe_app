import 'package:cookpedia_foodrecipe_app/features/create_recipe/presentation/states/cr_cook_time_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cr_text_text_form_widget.dart';

class CRCookTimeWidget extends StatefulWidget {
  const CRCookTimeWidget({
    super.key,
  });

  @override
  State<CRCookTimeWidget> createState() => _CRCookTimeWidgetState();
}

class _CRCookTimeWidgetState extends State<CRCookTimeWidget>
    with AutomaticKeepAliveClientMixin<CRCookTimeWidget> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CRTextTextFormWidget(
      label: "Cook Time",
      child: TextFormField(
          onSaved: (newValue) {
            context.read<CRCookTimeProvider>().saveCookTime(newValue);
          },
          validator: (value) {
            if (value == null || value == "") {
              return "Is Not Empty";
            }
            return null;
          },
          decoration: const InputDecoration(hintText: "1 hour, 30 mins, etc")),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
