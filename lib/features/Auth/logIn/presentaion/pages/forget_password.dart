import 'package:clinic/core/util/constants.dart';
import 'package:clinic/core/util/functions/navigator.dart';
import 'package:clinic/features/Auth/logIn/presentaion/pages/forget_password_2.dart';
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
          const Text(
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff020202),
                  fontWeight: FontWeight.w400),
              "أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل بريداً إلكترونياً مع تعليمات لإعادة ضبط كلمة المرور الخاصة بك "),
          SizedBox(
            height: 16.h,
          ),
          CustomTextField(
            title: "البريد الإلكتروني",
            textEditingController: TextEditingController(),
            radius: 12,
            keyboardType: TextInputType.text,
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: CustomBotton(
              textColor: Colors.white,
              bottonColor: AppColor.primaryColor,
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
        title: const Text(
          "إعادة تعيين كلمة المرور",
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
