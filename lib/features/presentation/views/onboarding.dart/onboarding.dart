

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
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
                      const AppButton(
                          buttonText: 'Register', 
                          color: AppColors.purple
                      ),
                      AppButton(
                        buttonText: 'Log in', 
                        color: AppColors.bgDark,
                        border: Border.all(width: 2, color: AppColors.purple),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}






// import 'package:flutter/material.dart';
// import 'package:streamaster/core/shared/app_images.dart';
// import 'package:streamaster/core/shared/colors.dart';
// import 'package:flutter_onboard/flutter_onboard.dart';
// import 'package:streamaster/domain/data/onboarding_model.dart';
// import 'package:streamaster/features/presentation/widgets/app_button.dart';
// import 'package:streamaster/features/presentation/widgets/app_spacer.dart';
// import 'package:streamaster/features/presentation/widgets/custom_text.dart';



// class OnboardingScreen extends StatelessWidget {
//   final PageController _pageController = PageController();

//   OnboardingScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bgDark,
//       body: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 10,  vertical: 70),
//         child: OnBoard(
//             pageController: _pageController,
//             // Either Provide onSkip Callback or skipButton Widget to handle skip state
//             onSkip: () {
//               // print('skipped');
//             },
//             // Either Provide onDone Callback or nextButton Widget to handle done state
//             onDone: () {
//               // print('done tapped');
//             },
//             onBoardData: onboarding,
//             pageIndicatorStyle: const PageIndicatorStyle(
//               width: 60,
//               inactiveColor: AppColors.purpleLight,
//               activeColor: AppColors.purple,
//               inactiveSize: Size(8, 8),
//               activeSize: Size(10, 10),
//             ),
//             titleStyles: const TextStyle(
//               color: AppColors.textDark,
//               fontSize: 18,
//               fontWeight: FontWeight.w900,
//               letterSpacing: 0.15,
//             ),
//             descriptionStyles: const TextStyle(
//               fontSize: 16,
//               color: AppColors.textDark,
//             ),
//             // Either Provide onDone Callback or nextButton Widget to handle done state
//             nextButton: OnBoardConsumer(
//               builder: (context, ref, child) {
//                 final state = ref.watch(onBoardStateProvider);
//                 return  SingleChildScrollView(
//                   child: SizedBox(
//                     height: 110,
//                     child: Column(
//                       children: [
//                         const AppButton(
//                           buttonText: 'Register', 
//                           color: AppColors.purple
//                         ),
                        
//                         AppButton(
//                           buttonText: 'Log in', 
//                           color: AppColors.bgDark,
//                           border: Border.all(width: 2, color: AppColors.purple),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//       ),
//     );
//   }

// }