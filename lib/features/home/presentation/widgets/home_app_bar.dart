import 'package:clinic/core/util/constants.dart';
import 'package:clinic/core/util/functions/navigator.dart';
import 'package:clinic/features/notification/presentation/pages/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w, top: 10.h),
      child: Row(
        children: [
          Text(
            "!أهلاً وسهلاً",
            style: TextStyle(
                fontSize: 12.sp,
                color: const Color(0xff6a6a6a),
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
