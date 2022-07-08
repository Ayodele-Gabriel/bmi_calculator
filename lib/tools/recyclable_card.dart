import 'package:flutter/material.dart';

class RecyclableCard extends StatelessWidget {
  RecyclableCard({required this.shade, required this.cardChild, this.onSelect});

  final Color shade;
  final Widget cardChild;
  final Function()? onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: shade,
        ),
        child: cardChild,
      ),
    );
  }
}