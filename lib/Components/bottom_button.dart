import 'package:flutter/material.dart';
import 'package:glucosense/resources/styles.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonTitle;
 
  BottomButton(this.buttonTitle, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          buttonTitle,
          style: BoldTextStyle,
        )),
        color: Colors.blueGrey,
        padding: EdgeInsets.only(bottom: 10),
        margin: EdgeInsets.only(top: 50),
        height: 75,
        width: double.infinity,
      ),
    );
  }
}
