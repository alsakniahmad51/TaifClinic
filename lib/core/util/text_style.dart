import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextStyle {
  static TextStyle textStyle(
      {required double fontSize,
      required Color? color,
      required FontWeight? fontWeight}) {
    return TextStyle(
        color: color,
        fontFamily: "Cairo",
        fontSize: fontSize.sp,
        fontWeight: fontWeight);
  }
}
