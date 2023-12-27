import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/cr_serves_provider.dart';
import 'cr_text_text_form_widget.dart';

class CRServesWidget extends StatefulWidget {
  const CRServesWidget({
    super.key,
  });

  @override
  State<CRServesWidget> createState() => _CRServesWidgetState();
}

class _CRServesWidgetState extends State<CRServesWidget>
    with AutomaticKeepAliveClientMixin<CRServesWidget> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CRTextTextFormWidget(
      label: "Serves",
      child: TextFormField(
        onSaved: (newValue) {
          context.read<CRServesProvider>().saveServes(newValue);
        },
        validator: (value) {
          if (value == null || value == "") {
            return "Is Not Empty";
          }
          return null;
        },
        decoration: const InputDecoration(hintText: "3 people"),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
