import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({
    super.key,
    required this.textColor,
    required this.bottonColor,
    required this.text,
    required this.topSpace,
    required this.onTap,
  });
  final Color? textColor;
  final Color? bottonColor;
  final String text;

  final double topSpace;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topSpace.h, left: 15.w),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: bottonColor, borderRadius: BorderRadius.circular(6.r)),
          width: 361.w,
          height: 44.h,
          child: Padding(
            padding: EdgeInsets.only(bottom: 3.h),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 17.sp,
                    color: textColor,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
