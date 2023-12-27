import 'package:flutter/material.dart';

class CRDividerWidget extends StatelessWidget {
  const CRDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Divider(),
    );
  }
}
