import 'package:clinic/features/Auth/presentation/login_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage3 extends StatelessWidget {
  const SignUpPage3({super.key});

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
          hint1: "كلمة السر",
          hint2: "تأكيد كلمة السر",
          onTap: () {},
        ));
  }
}
