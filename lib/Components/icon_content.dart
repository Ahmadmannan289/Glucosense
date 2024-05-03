import 'package:flutter/material.dart';
import 'package:glucosense/resources/styles.dart';

class IconContent extends StatelessWidget {
  final IconData Icon_used;
  final String Icon_label;

  IconContent(this.Icon_used, this.Icon_label);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icon_used,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          Icon_label,
          style: labelTextStyle,
        )
      ],
    );
  }
}
