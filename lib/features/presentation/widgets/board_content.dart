import 'package:flutter/material.dart';
import 'package:streamaster/core/shared/colors.dart';
import 'package:streamaster/domain/data/onboarding_model.dart';
import 'package:streamaster/features/presentation/widgets/app_spacer.dart';
import 'package:streamaster/features/presentation/widgets/custom_text.dart';


class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.heading,
    required this.description,
    required this.image,
    required this.currentPage
  }) : super(key: key);
  final String image, description, heading;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 3,),
        Image.asset(
          image  
        ),
        heightSpace(2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            onboarding.length,
              (index) => buildDot(index: index),
          ),  
        ),
        heightSpace(2),
       customText(text: heading, fontSize: 18, textColor: Theme.of(context).colorScheme.surface, textAlignment: TextAlign.center, fontWeight: FontWeight.w900),
       heightSpace(3),
       customText(text: description, fontSize: 16, textColor: Theme.of(context).colorScheme.surface, textAlignment: TextAlign.center)
        
        
      ],
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 10),
      margin: const EdgeInsets.only(right: 5),
      height: currentPage == index ? 9 : 6,
      width: currentPage == index ? 9 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? AppColors.purple : AppColors.purpleLight,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}