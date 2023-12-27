import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'gs_confirm_password_provider.dart';
import 'gs_confirm_password_visibility_provider.dart';
import 'gs_email_provider.dart';
import 'gs_password_provider.dart';
import 'gs_password_visibility_provider.dart';
import 'gs_remember_provider.dart';
import 'gs_user_name_provider.dart';

class GSStep5FormKeyProvider extends ChangeNotifier {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  GlobalKey<FormState> get key => _key;

  resetAll(BuildContext context) {
    context.read<GSConfirmPasswordProvider>().saveConfirmPassword(null);
    context.read<GSConfirmPasswordVisibilityPorvider>().resetVisibilty();
    context.read<GSPasswordProvider>().savePassword(null);
    context.read<GSPasswordVisibilityPorvider>().resetVisibilty();
    context.read<GSEmailProvider>().saveEmail(null);
    context.read<GSUserNameProvider>().saveUserName(null);
    context.read<GSPasswordProvider>().savePassword(null);
    context.read<GSRememberProvider>().resetRemember();

    notifyListeners();
  }
}
