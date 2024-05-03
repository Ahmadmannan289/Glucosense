import 'package:flutter/material.dart';
import 'package:glucosense/utils/colors.dart';

Image LogoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
  );
}

BoxDecoration bgDecoration() {
  return BoxDecoration(
    gradient: LinearGradient(
      colors: [
        hexStringToColor('8abed3'),
        hexStringToColor('aeb9d5'),
        hexStringToColor('1b89e2'),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onpressed;

  RoundIconButton(this.icon, this.onpressed);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      elevation: 6.0,
      onPressed: onpressed,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
