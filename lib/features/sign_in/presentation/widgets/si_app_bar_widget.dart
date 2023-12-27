import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/routes.dart';

class SIAppBarWidget extends StatelessWidget {
  const SIAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          context.go(Routes.splashRoute);
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
