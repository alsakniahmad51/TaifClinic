import 'package:clinic/core/util/constants.dart';
import 'package:clinic/features/home/presentation/bottonsbackground.dart';
import 'package:clinic/features/home/presentation/custom_botton.dart';
import 'package:clinic/features/home/presentation/welcome_text.dart';
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
            textColor: Colors.white,
            bottonColor: const Color(0xff4CAF50),
            text: 'إنشاء حساب',
            topSpace: MediaQuery.of(context).size.height - 233.h,
          ),
          CustomBotton(
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
