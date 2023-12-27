import 'package:flutter/material.dart';

import '../widgets/w_body_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
      ),
      body: const WBodyWidget(),
    );
  }
}
