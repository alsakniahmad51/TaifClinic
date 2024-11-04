import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelperText extends StatelessWidget {
  const HelperText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 35.h, bottom: 26.h),
          child: const Text(
            textAlign: TextAlign.center,
            'تحقق من بريدك',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          "لقد أرسلنا إلى بريدك الإلكتروني رمز لإعادة تعيين كلمة السر",
          style: TextStyle(
              fontSize: 16.sp,
              color: const Color(0xff898A8F),
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
