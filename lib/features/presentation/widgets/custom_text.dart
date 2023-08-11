import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
// import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:sizer/sizer.dart';


Widget customText(
        {required String text,
        required double fontSize,
        required Color textColor,
        FontWeight? fontWeight,
        TextAlign? textAlignment}
        ) =>
    Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) { 
      return Text(text,
          textAlign: textAlignment ?? TextAlign.left,
          style: TextStyle(
              fontFamily: 'Fira',
              color: textColor,
              fontWeight: fontWeight ?? FontWeight.w500,
              fontSize: fontSize.dp));
    });