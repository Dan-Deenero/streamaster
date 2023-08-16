

import 'package:flutter/material.dart';
import 'package:streamaster/config/keys/app_routes.dart';
import 'package:streamaster/config/router/app_router.dart';
import 'package:streamaster/core/shared/colors.dart';
import 'package:streamaster/domain/data/onboarding_model.dart';
import 'package:streamaster/features/presentation/widgets/app_button.dart';
import 'package:streamaster/features/presentation/widgets/app_spacer.dart';
import 'package:streamaster/features/presentation/widgets/board_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: onboarding.length,
                    itemBuilder: (context, index) => SplashContent(
                      image: onboarding[index].image,
                      heading: onboarding[index].heading,
                      description: onboarding[index].description,
                      currentPage: currentPage,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        heightSpace(3),
                        AppButton(
                            buttonText: 'Register', 
                            color: AppColors.purple,
                            onTap: () => {
                              router.go(AppRoutes.createAccount)
                            },
                        ),
                        AppButton(
                          buttonText: 'Log in', 
                          color: AppColors.bgDark,
                          border: Border.all(width: 2, color: AppColors.purple),
                          onTap: () => {
                              router.go(AppRoutes.login)
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}



