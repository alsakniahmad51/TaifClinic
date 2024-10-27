import 'package:clinic/core/util/text_style.dart';
import 'package:clinic/core/util/widgets/custom_divider.dart';
import 'package:clinic/core/util/widgets/google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinic/core/util/widgets/custom_text_field.dart';
import 'package:clinic/features/welcome/presentation/custom_botton.dart';

class AuthPageBody extends StatelessWidget {
  const AuthPageBody({
    super.key,
    required this.hint1,
    required this.hint2,
    required this.nextonTap,
    required this.allredyAccount,
    required this.signUp,
    required this.signUponTap,
    required this.forgetPassWord,
    required this.firstController,
    required this.secondController,
    required this.textBotton,
    this.firstValidator,
    this.secondValidator,
  });

  final String hint1;
  final String hint2;
  final String forgetPassWord;
  final String allredyAccount;
  final String signUp;
  final String textBotton;
  final void Function()? nextonTap;
  final void Function()? signUponTap;
  final TextEditingController firstController;
  final TextEditingController secondController;
  final String? Function(String?)? firstValidator;
  final String? Function(String?)? secondValidator;
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _formKey = GlobalKey<FormState>();

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 42.h),
              child: CustomTextField(
                hint: hint1,
                textEditingController: firstController,
                validator: firstValidator,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24.h),
              child: CustomTextField(
                hint: hint2,
                textEditingController: secondController,
                validator: secondValidator,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: CustomBotton(
                textColor: Colors.white,
                bottonColor: Colors.green,
                text: textBotton,
                topSpace: 164.h,
                onTap: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    nextonTap?.call();
                  }
                },
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
      ),
    );
  }
}
