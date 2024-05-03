import 'package:flutter/material.dart';
import 'package:glucosense/resources/styles.dart';

enum Gender {
  male,
  female,
}

Color malecardcolor = kInactivecardcolor;
Color femalecardcolor = kInactivecardcolor;

void updateColor(Gender gender) {
  //1 for male
  if (gender == Gender.male) {
    if (malecardcolor == kInactivecardcolor) {
      malecardcolor = kActivecardcolor;
      femalecardcolor = kInactivecardcolor;
    } else {
      malecardcolor = kInactivecardcolor;
    }
  }
  //2 for female
  if (gender == Gender.female) {
    if (femalecardcolor == kInactivecardcolor) {
      femalecardcolor = kActivecardcolor;
      malecardcolor = kInactivecardcolor;
    } else {
      femalecardcolor = kInactivecardcolor;
    }
  }
}

// we can also write the above function in single line statement:
// Condition ? if TRUE : if False;

// Gender selectedGender;

// change setstate() updateGender to selectedGender=Gender.male
// now change inside the Reusable_card function inactivecolor to selectedGender==Gender.male?activecolor:inactivecolor;

//same for female gender too
