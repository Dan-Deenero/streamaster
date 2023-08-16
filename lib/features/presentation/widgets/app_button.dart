import 'package:flutter/material.dart';import 'package:flutter_svg/flutter_svg.dart';
import 'custom_text.dart';


class AppButton extends StatelessWidget {
  final bool isActive;
  final String buttonText;
  final Color color;
  final VoidCallback? onTap;
  final Border? border;
  final bool hasIcon;
  final String? iconAsset;
  final bool isSmall;
  final bool isOrange;
  const AppButton({
    super.key,
    this.isActive = true,
    required this.buttonText,
    this.onTap,
    required this.color,
    this.iconAsset,
    this.border,
    this.hasIcon = true,
    this.isSmall = false,
    this.isOrange = false,
  });

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: !isActive ? null : onTap,
        child: Container(
          margin: const EdgeInsets.all(5),
            width: isSmall ? 225 : double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: color,
                border: border,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  iconAsset != null ? SvgPicture.asset(iconAsset!) : const SizedBox.shrink(),
                  const SizedBox(width:2),
                  customText(
                      text: buttonText, textColor: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                ],
              ),
            ),
          
          ),
      );
  }
}
