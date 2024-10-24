import 'package:clinic/core/util/functions/navigator.dart';
import 'package:clinic/core/util/widgets/auth_page_body.dart';
import 'package:clinic/features/Auth/logIn/presentaion/pages/login_page.dart';
import 'package:clinic/features/Auth/signUp/presentation/pages/sign_up_page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpPage1 extends StatelessWidget {
  const SignUpPage1({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstControl = TextEditingController();
    TextEditingController secondControl = TextEditingController();

    final supabase = Supabase.instance.client;
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
          hint1: "الاسم الأول",
          hint2: "الاسم الثاني",
          signUponTap: () {
            Moving.navToPage(context: context, page: const LoginPage());
          },
          signUp: "سجل دخول",
          nextonTap: () {
            Moving.navToPage(context: context, page: const SignUpPage2());
          },
          allredyAccount: 'لديك حساب بالفعل؟',
          forgetPassWord: '',
          firstController: firstControl,
          secondController: secondControl,
          textBotton: 'التالي',
        ));
  }
}
