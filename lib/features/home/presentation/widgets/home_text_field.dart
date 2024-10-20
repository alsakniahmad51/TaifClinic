import 'package:clinic/core/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeTextField extends StatelessWidget {
  const HomeTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.w),
      child: SizedBox(
        width: 329.w,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextField(
            cursorColor: Colors.black,
            style: MyTextStyle.textStyle(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600),
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
                prefixIconConstraints: BoxConstraints.loose(Size(50.w, 35.h)),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 1.w, right: 10.w),
                  child: SvgPicture.asset('assets/images/search.svg'),
                ),
                isCollapsed: true,
                contentPadding: const EdgeInsets.all(12),
                border: border(width: 1),
                enabledBorder: border(width: 1),
                focusedBorder: border(width: 2)),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder border({required double width}) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: width),
        borderRadius: BorderRadius.circular(24.r));
  }
}
