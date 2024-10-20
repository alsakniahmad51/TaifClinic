import 'package:clinic/features/home/presentation/widgets/filter_botton.dart';
import 'package:clinic/features/home/presentation/widgets/home_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            const Row(
              children: [
                FilterBotton(),
                HomeTextField(),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                        width: 170.w,
                        height: 110.h,
                        'assets/images/orders_history.svg'),
                  ),
                  SvgPicture.asset(
                      width: 170.w,
                      height: 110.h,
                      'assets/images/orders_day.svg'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
