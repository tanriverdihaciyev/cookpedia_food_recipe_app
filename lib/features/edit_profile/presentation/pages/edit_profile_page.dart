import '../widgets/ep_app_bar_widget.dart';
import '../widgets/ep_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_ext.dart';
import '../../../../core/resources/sizes.dart';
import '../states/ep_display_name_provider.dart';
import '../states/ep_form_key_provider.dart';
import '../states/ep_loading_provider.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(
          create: (context) => EPDisplayNameProvider(),
        ),
        ListenableProvider(
          create: (context) => EPFormKeyProvider(),
        ),
        ListenableProvider(
          create: (context) => EPLoadingProvider(),
        ),
      ],
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(
              double.infinity,
              context.height(Sizes.s0_1),
            ),
            child: const EPAppBarWidget()),
        body: const EPBodyWidget(),
      ),
    );
  }
}
