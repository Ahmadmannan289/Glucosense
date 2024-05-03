import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glucosense/reusable_widgets/google_button.dart';
import 'package:glucosense/reusable_widgets/inputFields.dart';
import 'package:glucosense/reusable_widgets/logo.dart';
import 'package:glucosense/reusable_widgets/signIn_signUp_buttons.dart';
import 'package:glucosense/screens/home_page.dart';
import 'package:glucosense/screens/reset_password.dart';
import 'package:glucosense/screens/sign_up.dart';

class signInScreen extends StatefulWidget {
  const signInScreen({super.key});

  @override
  State<signInScreen> createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: bgDecoration(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                25, MediaQuery.of(context).size.height * 0.125, 25, 0),
            child: Column(
              children: <Widget>[
                LogoWidget('assets/images/gluco.png'),
                const SizedBox(
                  height: 10,
                ),
                reusableTextField('Enter Email', Icons.alternate_email_outlined,
                    false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField('Enter Password', Icons.lock, true,
                    _passwordTextController),
                forgetpassword(context),
                // Modified FirebaseButton with error handling
                FirebaseButton(context, 'Sign In', () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  }).catchError((error) {
                    String errorMessage =
                        'An error occurred, please try again!';
                    if (error is FirebaseAuthException) {
                      errorMessage = error.message!;
                    }
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Sign In Failed'),
                          content: Text(errorMessage),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  });
                }),
                signUpOption(context),
                const SizedBox(
                  height: 10,
                ),
                image_Button(
                  context,
                  'assets/images/google.png',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an Account",
          style: TextStyle(color: Colors.white70),
        ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const signUpScreen()));
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }

  Widget forgetpassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ResetPasswordScreen())),
        child: const Text(
          'Forget password?',
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
