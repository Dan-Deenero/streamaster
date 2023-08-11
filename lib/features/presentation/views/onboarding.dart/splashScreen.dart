import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:streamaster/config/keys/app_routes.dart';
import 'package:streamaster/config/router/app_router.dart';
import 'package:streamaster/core/shared/app_images.dart';
import 'package:streamaster/core/shared/colors.dart';
import 'package:streamaster/features/presentation/views/onboarding.dart/onboarding.dart';
import 'package:streamaster/features/presentation/widgets/app_spacer.dart';
import 'package:streamaster/features/presentation/widgets/custom_text.dart';

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
      backgroundColor: AppColors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.googleLight, width: 30, height: 30,),
            customText(text: 'Streamaster', fontSize: 24, textColor: AppColors.bgLight)
          ],
        )),
    );
  }
}