import 'package:flutter/material.dart';

class AppColors {
  ThemeMode themeMode = ThemeMode.dark;

  static const Color scaffoldColor = Color(0xffF8F8FF);
  static const Color purple = Color(0xff760BFF);
  static const Color purpleLight = Color.fromARGB(120, 117, 11, 255);
  static const Color red = Color(0xffFF3D3D);
  static const Color formcolorv= Color(0xFF222222);
  static const Color orangey = Color(0xffFFC90C);
  static const Color blue = Color(0xff00AED4);
  static const Color till= Color(0xffFFFFFF);
  static const Color textLigh = Color(0xff121212);
  static const Color textDark = Color(0xffFFFFFF);
  static const Color bgLight = Color(0xfff2f2f2);
  static const Color bgDark = Color(0xff121212);
  static OutlineInputBorder errorBorder = const OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.red,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)));
  static OutlineInputBorder normalBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.till),
      borderRadius: BorderRadius.all(Radius.circular(10)));

  static OutlineInputBorder emptyBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.bgDark),
      borderRadius: BorderRadius.all(Radius.circular(10)));
}

