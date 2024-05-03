import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glucosense/reusable_widgets/inputFields.dart';
import 'package:glucosense/reusable_widgets/logo.dart';
import 'package:glucosense/reusable_widgets/signIn_signUp_buttons.dart';
import 'package:glucosense/screens/sign_in.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _usernameTextController = TextEditingController();

  void signUp(BuildContext context) async {
    // Add BuildContext as a parameter
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      );

      // Check if the 'users' collection exists, and create it if it doesn't
      final usersCollection = FirebaseFirestore.instance.collection('users');
      final userDoc = await usersCollection.doc(userCredential.user!.uid).get();

      if (!userDoc.exists) {
        // Collection doesn't exist, create it
        await usersCollection.doc(userCredential.user!.uid).set({
          'name': _usernameTextController.text,
          'email': _emailTextController.text,
        });
      } else {
        // Collection already exists, update the data
        await usersCollection.doc(userCredential.user!.uid).update({
          'name': _usernameTextController.text,
          'email': _emailTextController.text,
        });
      }

      print('Account successfully created!');
      print('Additional information stored.');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const signInScreen()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  // Uint8List? _image;
  //
  // void ImageSelect() async {
  //   Uint8List img = await pickImage(ImageSource.gallery);
  //
  //   setState(
  //     () {
  //       _image = img;
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Sign Up',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: bgDecoration(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                LogoWidget('assets/images/gluco.png'),
                const SizedBox(
                  height: 10,
                ),
                // Stack(
                //   children: [
                //     _image != null
                //         ? CircleAvatar(
                //             radius: 64,
                //             backgroundImage: MemoryImage(_image!),
                //           )
                //         : const CircleAvatar(
                //             radius: 64,
                //             backgroundImage:
                //                 AssetImage('assets/images/default_image.png'),
                //           ),
                //     Positioned(
                //       child: IconButton(
                //         onPressed: ImageSelect,
                //         icon: const Icon(Icons.add_a_photo),
                //       ),
                //       bottom: -10,
                //       left: 90,
                //     ),
                //   ],
                // ),
                const SizedBox(
                  height: 30,
                ),
                // reusableTextField(
                //     'Enter Username',
                //     Icons.perm_identity_outlined,
                //     false,
                //     _usernameTextController),
                // const SizedBox(
                //   height: 30,
                // ),
                reusableTextField(
                    'Enter Username',
                    Icons.perm_identity_outlined,
                    false,
                    _usernameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField('Enter Email', Icons.alternate_email_outlined,
                    false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField('Enter Password', Icons.lock, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                FirebaseButton(context, 'Sign Up', () {
                  signUp(context);
                  // FirebaseAuth.instance
                  //     .createUserWithEmailAndPassword(
                  //         email: _emailTextController.text,
                  //         password: _passwordTextController.text,)
                  //     .then((value) {
                  //   print('Created new Account');
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => signInScreen()));
                  // }).onError((error, stackTrace) {
                  //   print('Error ${error.toString()}');
                  // });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
