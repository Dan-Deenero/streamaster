import 'package:flutter/material.dart';
import 'package:streamaster/core/shared/colors.dart';


class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.dark;


  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }  
}

  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.bgDark,
    primaryColor: AppColors.purple,
    colorScheme: const ColorScheme.dark(
      background: AppColors.bgDark,
      primary: AppColors.formcolorv,
      secondary: AppColors.till,
      error: AppColors.red,
      surface: AppColors.textDark
    ),
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
    
    
  );

  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.bgLight,
    primaryColor: AppColors.purple,
    colorScheme: const ColorScheme.light(
      background: AppColors.bgLight,
      primary: AppColors.till,
      secondary: AppColors.formcolorv,
      error: AppColors.red,
      surface: AppColors.textLigh
    ),
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  );
