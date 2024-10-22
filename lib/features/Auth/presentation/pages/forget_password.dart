import 'package:clinic/core/util/functions/navigator.dart';
import 'package:clinic/core/util/text_style.dart';
import 'package:clinic/features/Auth/presentation/pages/forget_password_2.dart';
import 'package:clinic/core/util/widgets/custom_text_field.dart';
import 'package:clinic/features/welcome/presentation/custom_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
              textAlign: TextAlign.center,
              style: MyTextStyle.textStyle(
                  fontSize: 16,
                  color: const Color(0xff020202),
                  fontWeight: FontWeight.w400),
              "أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل بريداً إلكترونياً مع تعليمات لإعادة ضبط كلمة المرور الخاصة بك "),
          SizedBox(
            height: 16.h,
          ),
          const CustomTextField(hint: "البريد الإلكتروني"),
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: CustomBotton(
              textColor: Colors.white,
              bottonColor: Colors.green,
              text: "إرسال",
              topSpace: 40,
              onTap: () {
                Moving.navToPage(
                    context: context, page: const ForgetPassword2());
              },
            ),
          )
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "إعادة تعيين كلمة المرور",
          style: MyTextStyle.textStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
