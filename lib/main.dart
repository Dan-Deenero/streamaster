import 'package:flutter/material.dart';


import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:go_router/go_router.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:streamaster/config/router/app_router.dart';
import 'package:streamaster/features/presentation/views/onboarding.dart/splashScreen.dart';
import 'package:streamaster/core/shared/colors.dart';
import 'package:streamaster/home/home.dart';
import 'features/presentation/views/main_auth/create_account.dart';
import 'features/presentation/views/main_auth/login.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


void main() {
  runApp( Streamaster());
}

class Streamaster extends StatelessWidget {
  const Streamaster({super.key});
  @override
  Widget build(BuildContext context) {


    return OverlaySupport.global(
      child: FlutterSizer(builder: (context, orientation, screenType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          routerConfig: router,
        );
      })
    );
  }
}


