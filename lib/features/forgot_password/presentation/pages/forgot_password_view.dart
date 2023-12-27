import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/sizes.dart';
import '../states/forgot_password_view_model.dart';
import '../widgets/fp_app_bar_widget.dart';
import '../widgets/fp_body_widget.dart';
import '../widgets/fp_bottom_app_bar_widget.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(
          create: (context) => FPEmailProvider(),
        ),
        ListenableProvider(
          create: (context) => FPFormKeyProvider(),
        ),
        ListenableProvider(
          create: (context) => FPLoadingProvider(),
        )
      ],
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, context.height(Sizes.s0_1)),
            child: const FPAppBarWidget()),
        body: const FPBodyWidget(),
        bottomNavigationBar: const FPBottomAppBarWidget(),
      ),
    );
  }
}
