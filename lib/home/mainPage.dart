import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

authorizeAcess(BuildContext context){
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  users.doc('isAdmin').get();
}