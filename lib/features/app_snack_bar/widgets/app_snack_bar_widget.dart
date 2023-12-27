import 'package:cookpedia_foodrecipe_app/features/app_snack_bar/states/app_snack_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppSnackBarWidget extends StatefulWidget {
  const AppSnackBarWidget({super.key});

  @override
  State<AppSnackBarWidget> createState() => _AppSnackBarWidgetState();
}

class _AppSnackBarWidgetState extends State<AppSnackBarWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    AppSnackBarProvider appSnackBarProvider =
        context.watch<AppSnackBarProvider>();
    return Text(appSnackBarProvider.snackMessage!);
  }
}
