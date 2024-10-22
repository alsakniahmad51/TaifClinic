import 'package:clinic/core/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationAppBar extends StatelessWidget {
  const NotificationAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(height: 24.h, width: 24.w, 'assets/images/search.svg'),
        Padding(
          padding: EdgeInsets.only(right: 20.w, left: 250.w),
          child: Text(
            "الإشعارات",
            style: MyTextStyle.textStyle(
                fontSize: 22.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
