import 'package:cookpedia_foodrecipe_app/features/create_recipe/presentation/states/cr_origin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cr_text_text_form_widget.dart';

class CROriginWidget extends StatefulWidget {
  const CROriginWidget({
    super.key,
  });

  @override
  State<CROriginWidget> createState() => _CROriginWidgetState();
}

class _CROriginWidgetState extends State<CROriginWidget>
    with AutomaticKeepAliveClientMixin<CROriginWidget> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CRTextTextFormWidget(
      label: "Origin",
      child: TextFormField(
        onSaved: (newValue) {
          context.read<CROriginProvider>().saveLocation(newValue);
        },
        validator: (value) {
          if (value == null || value == "") {
            return "Is Not Empty";
          }
          return null;
        },
        decoration: const InputDecoration(
            hintText: "Location", suffixIcon: Icon(Icons.location_on_outlined)),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
