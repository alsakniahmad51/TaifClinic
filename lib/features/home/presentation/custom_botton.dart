import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({
    super.key,
    required this.textColor,
    required this.bottonColor,
    required this.text,
    required this.topSpace,
  });
  final Color? textColor;
  final Color? bottonColor;
  final String text;
  final double topSpace;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topSpace, left: 15.w),
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(bottom: 3.h),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: textColor,
                  fontFamily: "Cairo",
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: bottonColor, borderRadius: BorderRadius.circular(6.r)),
        width: 361.w,
        height: 44.h,
      ),
    );
  }
}
