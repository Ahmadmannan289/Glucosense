import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glucosense/screens/home_page.dart';
import 'package:glucosense/screens/profile_screen.dart';
import 'package:glucosense/screens/sign_in.dart';
import 'package:glucosense/services/google_services.dart';

import '../services/firebase_service.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  void initState() {
    super.initState();
    // Fetch user data when the widget is initialized
    fetchUserData();
  }

  late String accountName = 'Name';
  late String profileImageUrl = '';

  Future<void> fetchUserData() async {
    // Obtain the stream of user data
    Stream<Map<String, dynamic>> userDataStream =
        await Firebase_Service.streamUserData();

    userDataStream.listen((userData) {
      setState(() {
        // Update state variables based on received data
        accountName = userData['name'] ?? 'Account Name';
        profileImageUrl = userData['profileImageUrl'] ?? '';
      });
    }, onError: (error) {});
  }

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              accountName,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: profileImageUrl.isNotEmpty
                    ? Image.network(
                        profileImageUrl,
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: 90,
                        height: 90,
                        color: Colors.indigo,
                        child: const Icon(
                          Icons.camera_alt,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.cyan,
              // image: DecorationImage(,)
            ),
          ),
          ListTile(
            leading: const IconTheme(
              data: IconThemeData(size: 30),
              child: Icon(Icons.dashboard),
            ),
            title: const Text('Dashboard', style: TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          // const Divider(),
          // ListTile(
          //   leading: const IconTheme(
          //     data: IconThemeData(size: 30),
          //     child: Icon(Icons.cast_connected_outlined),
          //   ),
          //   title: const Text('Connectivity', style: TextStyle(fontSize: 20)),
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => const ConnectionScreen()));
          //   },
          // ),
          // const Divider(),
          // ListTile(
          //   leading: const IconTheme(
          //     data: IconThemeData(size: 30),
          //     child: Icon(Icons.settings),
          //   ),
          //   title: const Text('Settings', style: TextStyle(fontSize: 20)),
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => const SettingsScreen()));
          //   },
          // ),
          const Divider(),
          ListTile(
            leading: const IconTheme(
              data: IconThemeData(size: 30),
              child: Icon(Icons.person),
            ),
            title: const Text('Profile', style: TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const BioScreen()));
            },
          ),
          const Divider(),
          ListTile(
            leading: IconTheme(
              data: IconThemeData(size: 30),
              child: Icon(Icons.logout_sharp),
            ),
            title: const Text('Log Out', style: TextStyle(fontSize: 20)),
            onTap: () async {
              await FirebaseServices_Google().SignOutWithGoogle();
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const signInScreen()));
              }).onError((error, stackTrace) {
                print('Signed out from the home screen');
              });
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}

// currentAccountPicture: CircleAvatar(
// ),
// child: ClipOval(
// child: profileImageUrl.isNotEmpty
// ? Image.network(
// profileImageUrl,
// width: 90,
// height: 90,
// fit: BoxFit.cover,
// )
// // If Google sign-in is used, use Google profile image, else, use default camera icon
//     : isSignedInWithGoogle()
// ? FirebaseAuth.instance.currentUser?.photoURL != null
//     : Container(
// width: 90,
// height: 90,
// color: Colors.indigo,
// child: const Icon(
// Icons.camera_alt,
// size: 30,
// color: Colors.white,
// ),
// ),
// )),
// decoration: const BoxDecoration(
// color: Colors.cyan,
// // image: DecorationImage(,)
// ),
