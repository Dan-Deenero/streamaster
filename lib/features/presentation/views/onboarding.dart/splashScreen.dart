import 'package:flutter/material.dart';
import 'package:streamaster/config/keys/app_routes.dart';
import 'package:streamaster/config/router/app_router.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    
    // Simulate splash screen load time
    Future.delayed(const Duration(seconds: 5), () {
      router.go(AppRoutes.onboarding); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/photos/DARK-DEV-X.png',),
          ],
        )),
    );
  }
}