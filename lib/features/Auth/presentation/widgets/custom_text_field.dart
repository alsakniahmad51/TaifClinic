import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
  });
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          decoration: InputDecoration(
            focusedBorder: outlineBorder(),
            hintText: hint,
            hintStyle: textStyle(),
            border: outlineBorder(),
          ),
        ),
      ),
    );
  }

  TextStyle textStyle() {
    return TextStyle(
        color: Colors.black,
        fontFamily: "Cairo",
        fontSize: 17.sp,
        fontWeight: FontWeight.w400);
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(6.r),
    );
  }
}
