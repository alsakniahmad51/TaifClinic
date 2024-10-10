import 'package:clinic/core/util/functions/navigator.dart';
import 'package:clinic/features/Auth/presentation/login_page_body.dart';
import 'package:clinic/features/Auth/presentation/pages/sign_up_page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage1 extends StatelessWidget {
  const SignUpPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "إنشاء حساب",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Cairo",
                fontSize: 16.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
        body: LoginPageBody(
          hint1: "الاسم الأول",
          hint2: "الاسم الثاني",
          onTap: () {
            Moving.navToPage(context: context, page: const SignUpPage2());
          },
        ));
  }
}
