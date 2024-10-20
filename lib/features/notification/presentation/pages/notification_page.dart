import 'package:clinic/core/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Text(
            "الإشعارات",
            style: MyTextStyle.textStyle(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
