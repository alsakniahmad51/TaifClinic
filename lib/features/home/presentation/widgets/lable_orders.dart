import 'package:clinic/core/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LableOrders extends StatelessWidget {
  const LableOrders({
    super.key,
    required this.text,
    required this.padding,
  });
  final String text;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Icon(
          Icons.arrow_back_ios_new,
          size: 10,
          color: AppColor.primaryColor,
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'عرض الكل',
            style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: AppColor.primaryColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.primaryColor),
          ),
        ),
        SizedBox(
          width: padding.w,
        ),
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: Text(
            text,
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
