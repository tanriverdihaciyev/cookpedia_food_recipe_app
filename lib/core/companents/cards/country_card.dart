import 'package:flutter/material.dart';

import '../../../features/get_started/presentation/pages/step_0/models/gs_country_model.dart';
import '../../resources/sizes.dart';

class CountryCard extends StatelessWidget {
  const CountryCard({
    super.key,
    required this.country,
    required this.onTap,
    required this.index,
    required this.selectedIndex,
  });
  final GSCountryModel country;
  final void Function() onTap;
  final int index;
  final int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(
              Sizes.s15.toDouble(),
            ),
            right: Radius.circular(
              Sizes.s15.toDouble(),
            ),
          ),
          side: BorderSide(
              color:
                  selectedIndex == index ? Colors.red : Colors.grey.shade800)),
      child: ListTile(
        leading: Image.asset(
          country.flag,
          fit: BoxFit.cover,
          height: 25,
        ),
        title: Text("${country.sortName} ${country.longName}"),
        onTap: onTap,
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
    );
  }
}
