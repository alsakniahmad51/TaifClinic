import 'package:clinic/core/util/functions/navigator.dart';
import 'package:clinic/core/util/text_style.dart';
import 'package:clinic/features/Auth/presentation/pages/forget_password.dart';
import 'package:clinic/features/Auth/presentation/widgets/custom_divider.dart';
import 'package:clinic/features/Auth/presentation/widgets/custom_text_field.dart';
import 'package:clinic/features/Auth/presentation/widgets/google_button.dart';
import 'package:clinic/features/welcome/presentation/custom_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody(
      {super.key,
      required this.hint1,
      required this.hint2,
      required this.nextonTap,
      required this.allredyAccount,
      required this.signUp,
      required this.signUponTap,
      required this.forgetPassWord});
  final String hint1;
  final String hint2;
  final String forgetPassWord;
  final String allredyAccount;
  final String signUp;
  final void Function()? nextonTap;
  final void Function()? signUponTap;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 42.h),
            child: CustomTextField(
              hint: hint1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 24.h),
            child: CustomTextField(
              hint: hint2,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 10.h, right: MediaQuery.of(context).size.width / 1.72),
            child: InkWell(
              onTap: () {
                Moving.navToPage(
                    context: context, page: const ForgetPassword());
              },
              child: Text(
                forgetPassWord,
                style: MyTextStyle.textStyle(
                    fontSize: 15,
                    color: const Color(0xff898A8F),
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: CustomBotton(
              textColor: Colors.white,
              bottonColor: Colors.green,
              text: "التالي",
              topSpace: 164.h,
              onTap: nextonTap,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 45.h, left: 10.w, right: 10.w),
            child: const CustomDivider(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 36.h),
            child: const GoogleButton(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 54.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: signUponTap,
                  child: Text(
                    signUp,
                    style: MyTextStyle.textStyle(
                        fontSize: 11,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Text(
                  allredyAccount,
                  style: MyTextStyle.textStyle(
                      fontSize: 11,
                      color: Colors.black45,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
