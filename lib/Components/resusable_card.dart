import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color_obj;
  final Widget CardChild;

  ReusableCard(this.color_obj, this.CardChild);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CardChild,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color_obj,
      ),
    );
  }
}
