import 'package:flutter/material.dart';
import 'package:glucosense/reusable_widgets/logo.dart';

import '../Components/gender_function.dart';
import '../Components/icon_content.dart';
import '../Components/resusable_card.dart';
import '../navigation_bar/nav_bar.dart';
import '../resources/styles.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      drawer: const NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'Settings',
          style: BoldTextStyle,
        ),
      ),
      body: Container(
        decoration: bgDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Select Gender',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.male);
                        print('Male button was pressed');
                      });
                    },
                    child: ReusableCard(
                      malecardcolor,
                      IconContent(Icons.male, 'Male'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.female);
                        print('Female button pressed');
                      });
                    },
                    child: ReusableCard(
                        femalecardcolor, IconContent(Icons.female, 'Female')),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
