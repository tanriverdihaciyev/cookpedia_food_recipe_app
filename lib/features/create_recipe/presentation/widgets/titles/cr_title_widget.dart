import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/cr_title_provider.dart';
import '../cr_text_text_form_widget.dart';

class CRTitleWidget extends StatefulWidget {
  const CRTitleWidget({
    super.key,
  });

  @override
  State<CRTitleWidget> createState() => _CRTitleWidgetState();
}

class _CRTitleWidgetState extends State<CRTitleWidget>
    with AutomaticKeepAliveClientMixin<CRTitleWidget> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CRTextTextFormWidget(
      label: "Title",
      child: TextFormField(
        decoration: const InputDecoration(hintText: "Recipe Title"),
        validator: (value) {
          if (value == null || value == "") {
            return "Is Not Empty";
          }
          return null;
        },
        onSaved: (newValue) {
          context.read<CRTitleProvider>().saveTitle(newValue);
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
