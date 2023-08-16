import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:streamaster/features/presentation/widgets/app_spacer.dart';
import 'package:streamaster/features/presentation/widgets/custom_text.dart';
import 'package:streamaster/features/presentation/widgets/text_box.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late File _image = File('');

  final user = FirebaseAuth.instance.currentUser!;
  final _firestore = FirebaseFirestore.instance.collection('users');
  final FirebaseStorage _storage = FirebaseStorage.instance;

  getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    Reference ref = _storage.ref().child('users').child('${user.uid}.jpg');
    await ref.putFile(_image);
    String downloadURL = await ref.getDownloadURL();
    await _firestore.doc(user.uid).update({'profilePicture': downloadURL});
  }

  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.surface,
              title: customText(
                  text: "Edit $field",
                  fontSize: 16,
                  textColor: Theme.of(context).colorScheme.primary),
              content: TextField(
                autofocus: true,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
                decoration: InputDecoration(
                  hintText: "Enter new $field",
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                onChanged: (value) {
                  newValue = value;
                },
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: customText(
                        text: 'cancel',
                        fontSize: 16,
                        textColor: Theme.of(context).colorScheme.primary)),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(newValue),
                    child: customText(
                        text: 'save',
                        fontSize: 16,
                        textColor: Theme.of(context).colorScheme.primary))
              ],
            ));

    if (newValue.trim().length > 0) {
      await _firestore.doc(user.uid).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<DocumentSnapshot>(
      stream: _firestore.doc(user.uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final userData = snapshot.data!.data() as Map<String, dynamic>;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                          radius: 65,
                          backgroundImage:
                              AssetImage(userData['profilePicture'])),
                      Positioned(
                          bottom: -10,
                          left: 80,
                          child: GestureDetector(
                              onTap: () {
                                getImage();
                              },
                              child: const Icon(Icons.add_a_photo))),
                    ],
                  ),
                ),
                heightSpace(5),
                Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.purpleAccent)),
                      onPressed: () async {
                        await _uploadImage();
                      },
                      child: customText(
                          text: 'Update',
                          fontSize: 16,
                          textColor: Theme.of(context).colorScheme.surface)),
                ),
                heightSpace(3),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: customText(
                      text: 'My Details',
                      fontSize: 18,
                      textColor: Theme.of(context).colorScheme.surface),
                ),
                MyTextBox(
                    text: userData['username'],
                    sectionName: 'username',
                    onPressed: () {
                      editField('username');
                    }),
                MyTextBox(
                    text: userData['address'],
                    sectionName: 'address',
                    onPressed: () {
                      editField('address');
                    })
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error${snapshot.error}'),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}
