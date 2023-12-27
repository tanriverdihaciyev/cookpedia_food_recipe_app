import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/routes.dart';

class FPAppBarWidget extends StatelessWidget {
  const FPAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          context.go(Routes.signInRoute);
        },
        icon: const Icon(
          Icons.arrow_back,
        ),
      ),
    );
  }
}
