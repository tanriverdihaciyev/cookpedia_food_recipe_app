import 'package:flutter/material.dart';

import '../widgets/main_body_widget.dart';
import '../widgets/main_bottom_app_bar_widget.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainBodyWidget(),
      bottomNavigationBar: MainBottomAppBarWidget(),
    );
  }
}
