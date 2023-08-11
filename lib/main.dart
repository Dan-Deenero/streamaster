import 'package:flutter/material.dart';
import 'package:streamaster/core/shared/colors.dart';
import 'package:streamaster/home/home.dart';
import 'features/presentation/views/main_auth/create_account.dart';
import 'features/presentation/views/main_auth/login.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      home: HomePage() ,
    );
  }
}
