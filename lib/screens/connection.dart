import 'package:flutter/material.dart';
import 'package:glucosense/reusable_widgets/logo.dart';

import '../navigation_bar/nav_bar.dart';
import '../resources/styles.dart';

class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({super.key});

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  bool isConnected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      drawer: const NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'Connection',
          style: BoldTextStyle,
        ),
      ),
      body: Container(
        decoration: bgDecoration(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isConnected = !isConnected;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      // Adjust padding as needed
                      backgroundColor: Colors.blueGrey,
                      foregroundColor:
                          Colors.red // Set the button's background color
                      ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.power_settings_new_outlined,
                        size: 100,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16), // Add some spacing
              isConnected
                  ? Text(
                      'Connected',
                      style: TextStyle(fontSize: 24, color: Colors.green),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
