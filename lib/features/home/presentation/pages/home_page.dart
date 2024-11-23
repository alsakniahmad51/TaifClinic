import 'package:clinic/features/home/presentation/widgets/home_page_body.dart';
import 'package:clinic/features/home/presentation/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Text(
            "!أهلاً وسهلاً",
            style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 10.w,
          ),
        ],
      ),
      body: const HomePageBody(),
    );
  }
}
