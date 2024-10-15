import 'package:clinic/core/util/constants.dart';
import 'package:clinic/core/util/functions/navigator.dart';
import 'package:clinic/features/Auth/presentation/pages/login_page.dart';
import 'package:clinic/features/Auth/presentation/pages/sign_up_page1.dart';
import 'package:clinic/features/welcome/presentation/bottonsbackground.dart';
import 'package:clinic/features/welcome/presentation/custom_botton.dart';
import 'package:clinic/features/welcome/presentation/welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F8FF),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Image.asset(logo),
          ),
          const Bottonsbackground(),
          const WelcomeText(),
          CustomBotton(
            onTap: () {
              Moving.navToPage(context: context, page: const SignUpPage1());
            },
            textColor: Colors.white,
            bottonColor: const Color(0xff4CAF50),
            text: 'إنشاء حساب',
            topSpace: MediaQuery.of(context).size.height - 233.h,
          ),
          CustomBotton(
            onTap: () {
              Moving.navToPage(context: context, page: const LoginPage());
            },
            textColor: Colors.black,
            bottonColor: const Color(0xffE4F3E5),
            text: 'تسجيل دخول',
            topSpace: MediaQuery.of(context).size.height - 167.h,
          )
        ],
      ),
    );
  }
}
