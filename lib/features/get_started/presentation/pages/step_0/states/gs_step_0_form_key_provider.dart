import 'package:flutter/material.dart';

class GSStep0FormKeyProvider extends ChangeNotifier {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  GlobalKey<FormState> get key => _key;
}
