import 'package:flutter/material.dart';

class CRFormKeyProvider extends ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
}
