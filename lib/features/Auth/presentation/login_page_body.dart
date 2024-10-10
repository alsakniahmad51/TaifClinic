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
      required this.onTap});
  final String hint1;
  final String hint2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
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
          padding: EdgeInsets.only(right: 15.w),
          child: CustomBotton(
              textColor: Colors.white,
              bottonColor: Colors.green,
              text: "التالي",
              topSpace: 174.h,
              onTap: onTap),
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
                onTap: () {},
                child: Text(
                  "سجل دخول",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Cairo",
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                "لديك حساب الفعل ؟ ",
                style: TextStyle(
                    color: Colors.black45,
                    fontFamily: "Cairo",
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        )
      ],
    );
  }
}
