import 'package:clinic/core/util/text_style.dart';
import 'package:clinic/features/notification/presentation/widgets/notification_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [
          NotificationAppBar(),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 16.w, top: 30.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  textAlign: TextAlign.end,
                  "الأحدث",
                  style: MyTextStyle.textStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
