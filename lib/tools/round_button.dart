import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({required this.icon, this.onTouch});

  final IconData icon;
  final Function()? onTouch;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      onPressed: onTouch,
      child: Icon(icon),
    );
  }
}