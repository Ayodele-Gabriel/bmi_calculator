import 'package:flutter/material.dart';

import '../constants.dart';

class IconView extends StatelessWidget {
  IconView({required this.icon, required this.gender});

  final IconData icon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: kGenderTextStyle,
        ),
      ],
    );
  }
}