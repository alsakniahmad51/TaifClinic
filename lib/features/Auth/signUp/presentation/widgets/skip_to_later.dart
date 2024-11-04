import 'package:clinic/core/util/functions/navigator.dart';
import 'package:clinic/features/Auth/logIn/presentaion/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkipToLater extends StatelessWidget {
  const SkipToLater({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Moving.navToPage(context: context, page: const LoginPage());
      },
      child: Text(
        textAlign: TextAlign.center,
        "تخطي وسوف أؤكد في وقت لاحق",
        style: TextStyle(
            fontSize: 16.sp,
            color: Colors.blue[400],
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
