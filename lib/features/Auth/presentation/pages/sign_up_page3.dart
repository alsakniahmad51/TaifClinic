import 'package:clinic/core/util/functions/navigator.dart';
import 'package:clinic/features/Auth/presentation/login_page_body.dart';
import 'package:clinic/features/Auth/presentation/pages/login_page.dart';
import 'package:clinic/features/Auth/presentation/pages/sign_up_page2.dart';
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
          signUponTap: () {
            Moving.navToPage(context: context, page: const LoginPage());
          },
          signUp: "سجل دخول",
          nextonTap: () {},
          allredyAccount: 'لديك حساب بالفعل؟',
          forgetPassWord: '',
        ));
  }
}
