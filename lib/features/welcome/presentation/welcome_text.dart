import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 60.w, top: MediaQuery.of(context).size.height - 322.h),
      child: Text(
        "أهلاً بك في تطبيق طيف للأشعة",
        style: TextStyle(
            fontFamily: "Cairo", fontSize: 24.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
