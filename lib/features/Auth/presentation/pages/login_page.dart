import 'package:clinic/core/util/functions/navigator.dart';
import 'package:clinic/features/Auth/presentation/login_page_body.dart';
import 'package:clinic/features/Auth/presentation/pages/sign_up_page1.dart';
import 'package:clinic/features/Auth/presentation/pages/sign_up_page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "تسجيل الدخول",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Cairo",
                fontSize: 16.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
        body: LoginPageBody(
          signUponTap: () {
            Moving.navToPage(context: context, page: const SignUpPage1());
          },
          signUp: "أنشئ حساب",
          allredyAccount: "ليس لديك حساب؟",
          hint1: "البريد الالكتروني",
          hint2: "كلمة السر",
          nextonTap: () {},
        ));
  }
}
