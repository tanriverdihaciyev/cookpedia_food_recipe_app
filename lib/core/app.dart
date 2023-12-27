import 'package:cookpedia_foodrecipe_app/core/extensions/context_ext.dart';
import 'package:flutter/material.dart';

import 'resources/routes.dart';
import 'resources/sizes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouteManager().router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(
                Sizes.s15.toDouble(),
              ),
              right: Radius.circular(
                Sizes.s15.toDouble(),
              ),
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
            elevation: 0, backgroundColor: Colors.transparent),
        inputDecorationTheme: InputDecorationTheme(
          errorStyle: context.textTheme.bodyMedium?.copyWith(color: Colors.red),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(
                  Sizes.s15.toDouble(),
                ),
                right: Radius.circular(
                  Sizes.s15.toDouble(),
                ),
              ),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
