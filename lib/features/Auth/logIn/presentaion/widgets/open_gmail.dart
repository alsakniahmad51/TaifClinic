import 'package:clinic/features/welcome/presentation/custom_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OpenGmail extends StatelessWidget {
  const OpenGmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 90.w, left: 76.w, bottom: 26.h),
      child: CustomBotton(
        textColor: Colors.white,
        bottonColor: Colors.green,
        text: "فتح تطبيق البريد الإلكتروني",
        topSpace: 26,
        onTap: () async {
          // await LaunchApp.openApp(
          //     androidPackageName: 'com.google.android.gm', openStore: true);
        },
      ),
    );
  }
}
