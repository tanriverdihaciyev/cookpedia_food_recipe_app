import 'package:flutter/material.dart';

import '../../../../../../../core/resources/assets.dart';
import '../models/gs_country_model.dart';

class GSCountryProvider extends ChangeNotifier {
  int? _selectedCountry;

  int? get selectedCountry => _selectedCountry;

  bool _isSelected() => _selectedCountry != null;

  GSCountryModel? get countryModel =>
      _isSelected() ? _countrys[_selectedCountry!] : null;

  final List<GSCountryModel> _countrys = [
    GSCountryModel(
        longName: "Azerbaijan", sortName: "AZ", flag: AssetsPaths.az.flagToPath)
  ];

  List<GSCountryModel> get countrys => _countrys;

  resetCountry() {
    _selectedCountry = null;
    notifyListeners();
  }

  selectCountry(int index) {
    if (index == _selectedCountry) {
      _selectedCountry = null;
    } else {
      _selectedCountry = index;
    }
    notifyListeners();
  }
}
