import 'package:clinic/core/util/functions/navigator.dart';
import 'package:clinic/core/util/widgets/auth_page_body.dart';
import 'package:clinic/features/Auth/presentation/pages/login_page.dart';
import 'package:clinic/features/Auth/presentation/pages/sign_up_page3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage2 extends StatelessWidget {
  const SignUpPage2({super.key});

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
        body: AuthPageBody(
          hint1: "البريد الإلكتروني",
          hint2: "رقم الهاتف",
          signUponTap: () {
            Moving.navToPage(context: context, page: const LoginPage());
          },
          signUp: "سجل دخول",
          nextonTap: () {
            Moving.navToPage(context: context, page: const SignUpPage3());
          },
          allredyAccount: 'لديك حساب بالفعل؟',
          forgetPassWord: '',
        ));
  }
}
