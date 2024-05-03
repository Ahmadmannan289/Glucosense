import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:glucosense/navigation_bar/nav_bar.dart';
import 'package:glucosense/resources/styles.dart';
import 'package:glucosense/reusable_widgets/logo.dart';
import 'package:glucosense/services/firebase_service.dart';
import 'package:image_picker/image_picker.dart';

class BioScreen extends StatefulWidget {
  const BioScreen({Key? key}) : super(key: key);

  @override
  _BioScreenState createState() => _BioScreenState();
}

class _BioScreenState extends State<BioScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _selectedTitle = 'Profile';
  File? _image;
  late String _name = '';
  late String _email = '';
  late String _profileImageUrl = '';

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    // Obtain the stream of user data
    Stream<Map<String, dynamic>> userDataStream =
        await Firebase_Service.streamUserData();

    // Listen to the stream to handle data as it arrives
    userDataStream.listen((userData) {
      setState(() {
        // Update state variables based on received data
        _name = userData['name'] ?? '';
        _email = userData['email'] ?? '';
        _profileImageUrl = userData['profileImageUrl'] ?? '';
      });
    }, onError: (error) {
      // Handle stream errors
      print('Error fetching user data: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'Profile',
          style: BoldTextStyle,
        ),
      ),
      drawer: const NavBar(),
      body: Container(
        decoration: bgDecoration(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LogoWidget('assets/images/gluco.png'),

              Container(
                alignment: Alignment.topCenter,
                // padding: const EdgeInsets.only(top: 1),
                child: ClipOval(
                  child: GestureDetector(
                    onTap: () {
                      if (_profileImageUrl.isNotEmpty) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: SizedBox(
                                width: 200,
                                height: 200,
                                child: Image.network(_profileImageUrl,
                                    fit: BoxFit.cover),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      color: Colors.indigo,
                      child: _image == null
                          ? (_profileImageUrl.isNotEmpty
                              ? CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      NetworkImage(_profileImageUrl),
                                )
                              : const Icon(
                                  Icons.camera_alt,
                                  size: 50,
                                  color: Colors.white,
                                ))
                          : Image.file(_image!, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: ElevatedButton.icon(
                  onPressed: _getImage,
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Edit Photo',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),

              unchangeableTextField(Icons.person, _name),
              const SizedBox(height: 5),

              unchangeableTextField(Icons.email, _email),

              const SizedBox(height: 20),
              Container(
                width: 200,
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: ElevatedButton.icon(
                  onPressed: _updateProfile,
                  icon: const Icon(
                    Icons.update,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Confirm',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              SizedBox(
                  height: MediaQuery.of(context)
                      .padding
                      .bottom), // Ensure bottom padding for safe area
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Select Image",
            style: BoldTextStyleblack,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title:
                    const Text('Pick from Gallery', style: TitleTextStyleblack),
                onTap: () async {
                  Navigator.of(context).pop();
                  final pickedFile =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      _image = File(pickedFile.path);
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a Picture', style: TitleTextStyleblack),
                onTap: () async {
                  Navigator.of(context).pop();
                  final pickedFile =
                      await picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    setState(() {
                      _image = File(pickedFile.path);
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _updateProfile() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        if (user.providerData[0].providerId == 'google.com') {
          _name = FirebaseAuth.instance.currentUser!.displayName!;
          _email = user.email!;
        }

        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({
          'name': _name,
          'email': _email,
        });

        if (_image != null) {
          String imagePath = 'users/${user.uid}/profile_image.jpg';
          Reference storageReference =
              FirebaseStorage.instance.ref().child(imagePath);
          UploadTask uploadTask = storageReference.putFile(_image!);
          await uploadTask.whenComplete(() async {
            String imageUrl = await storageReference.getDownloadURL();

            await FirebaseFirestore.instance
                .collection('users')
                .doc(user.uid)
                .update({
              'profileImageUrl': imageUrl,
            });
          });
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error updating profile. Please try again later.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Widget unchangeableTextField(IconData icon, String value) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
      child: TextField(
        enabled: false,
        readOnly: true,
        controller: TextEditingController(text: value),
        style: TextStyle(color: Colors.black.withOpacity(0.9)),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Colors.white.withOpacity(0.6),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
        ),
      ),
    );
  }
}
