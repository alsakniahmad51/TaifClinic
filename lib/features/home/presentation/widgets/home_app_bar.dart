import 'package:clinic/core/util/constants.dart';
import 'package:clinic/core/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "أحمد موسى",
          style: MyTextStyle.textStyle(
              fontSize: 16.sp,
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: 4.w,
        ),
        SvgPicture.asset(width: 24.w, height: 24.h, logoDoctor),
        SizedBox(
          width: 16.w,
        )
      ],
    );
  }
}
