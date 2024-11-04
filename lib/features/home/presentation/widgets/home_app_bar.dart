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
          Padding(
            padding: EdgeInsets.only(right: 220.w),
            child: InkWell(
              onTap: () {
                Moving.navToPage(
                    context: context, page: const NotificationPage());
              },
              child: SvgPicture.asset(
                notification,
                height: 44.h,
                width: 44.w,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "!أهلاً وسهلاً",
                style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff6a6a6a),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 4.h,
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    const Icon(Icons.keyboard_arrow_down_sharp),
                    Text(
                      "أحمد موسى",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
