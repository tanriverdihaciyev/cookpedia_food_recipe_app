import 'gs_date_of_birth_provider.dart';
import 'gs_full_name_provider.dart';
import 'gs_gender_provider.dart';
import 'gs_image_path_provider.dart';
import 'gs_phone_number_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GSStep4FormKeyProvider extends ChangeNotifier {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  GlobalKey<FormState> get key => _key;

  resetAll(BuildContext context) {
    context.read<GSDateOfBirthProvider>().saveDateOfBirth(null);
    context.read<GSFullNameProvider>().saveFullName(null);
    context.read<GSGenderProvider>().saveGender(null);
    context.read<GSImagePathProvider>().removeImage();
    context.read<GSPhoneNumberProvider>().savePhoneNumber(null);
  }
}
