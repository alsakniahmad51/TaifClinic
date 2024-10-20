import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GmailLogo extends StatelessWidget {
  const GmailLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 119.h),
      child: SvgPicture.asset(
          width: 80.w, height: 80.w, 'assets/images/Gmail_logo.svg'),
    );
  }
}
