import 'package:flutter/material.dart';
import 'package:glucosense/screens/home_page.dart';
import 'package:glucosense/services/google_services.dart';

Container image_Button(BuildContext context, String image) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: ElevatedButton(
      onPressed: () async {
        await FirebaseServices_Google().SignInWithGoogle();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.white70;
          }
          return Colors.white;
        }),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            image,
            width: 40,
            height: 40,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'Sign in with Google',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
    ),
  );
}
