import 'package:cookpedia_foodrecipe_app/core/extensions/context_ext.dart';
import 'package:cookpedia_foodrecipe_app/core/resources/sizes.dart';
import 'package:flutter/material.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget(
      {super.key, this.logo, this.text, this.des, this.child});
  final Widget? logo;
  final String? text;
  final String? des;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(Sizes.s30.toDouble()),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            logo ?? const FlutterLogo(size: Sizes.s100),
            SizedBox(
              height: Sizes.s10.toDouble(),
            ),
            Text(
              text ?? "Sign Up Successful!",
              style: context.textTheme.headlineSmall
                  ?.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Sizes.s10.toDouble(),
            ),
            Text(
              des ??
                  "Your account has been created.\nPlease wait a moment, we are\n preparing for you..",
              style: context.textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: Sizes.s10.toDouble(),
            ),
            child ?? const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
