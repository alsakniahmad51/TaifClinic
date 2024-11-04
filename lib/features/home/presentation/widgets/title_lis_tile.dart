import 'package:clinic/core/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleListTile extends StatelessWidget {
  const TitleListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "اسم المريض",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        Text(
          "طلب تصوير شعاعي لمريض",
          style: TextStyle(
              fontSize: 13.sp, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
        SizedBox(
          height: 3.h,
        ),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Text(
                'التفاصيل',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: AppColor.primaryColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.primaryColor),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 10,
                color: AppColor.primaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
