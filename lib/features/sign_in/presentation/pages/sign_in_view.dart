import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/sizes.dart';
import 'package:flutter/material.dart';

import '../widgets/si_app_bar_widget.dart';
import '../widgets/si_body_widget.dart';
import '../widgets/si_navigation_bar_widget.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          double.infinity,
          context.height(Sizes.s0_1),
        ),
        child: const SIAppBarWidget(),
      ),
      body: const SIBodyWidget(),
      bottomNavigationBar: const SIBottomNavigationBarWidget(),
    );
  }
}
