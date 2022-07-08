import 'package:flutter/material.dart';

import '../constants.dart';

class BaseButton extends StatelessWidget {
  BaseButton({required this.onTap, required this.buttonLabel});

  final Function()? onTap;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        padding: EdgeInsets.only(bottom: 10.0),
        child: Center(
          child: Text(
            buttonLabel,
            style: kContainerTextStyle,
          ),
        ),
      ),
    );
  }
}