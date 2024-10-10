import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bottonsbackground extends StatelessWidget {
  const Bottonsbackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height - 358.h),
      child: Container(
        height: 358.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(55.r),
                topRight: Radius.circular(55.r))),
      ),
    );
  }
}
