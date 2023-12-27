import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/cr_description_provider.dart';
import 'cr_text_text_form_widget.dart';

class CRDescriptionWidget extends StatefulWidget {
  const CRDescriptionWidget({
    super.key,
  });

  @override
  State<CRDescriptionWidget> createState() => _CRDescriptionWidgetState();
}

class _CRDescriptionWidgetState extends State<CRDescriptionWidget>
    with AutomaticKeepAliveClientMixin<CRDescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CRTextTextFormWidget(
      label: "Description",
      child: TextFormField(
        onSaved: (newValue) {
          context.read<CRDescriptionProvider>().saveDescription(newValue);
        },
        validator: (value) {
          if (value == null || value == "") {
            return "Is Not Empty";
          }
          return null;
        },
        decoration: const InputDecoration(hintText: "Recipe Description"),
        maxLines: 5,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
