import 'package:clinic/core/util/constants.dart';
import 'package:clinic/features/home/presentation/widgets/home_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorsPageBody extends StatelessWidget {
  const DoctorsPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16.h, right: 16.w, left: 16.w),
            child: const HomeSearchTextFiled(
              hint: 'اسم الطبيب',
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: SizedBox(
              height: 80.h,
              child: Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                child: ListTile(
                  trailing: Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ),
                  leading: SvgPicture.asset(
                    person,
                    height: 44.h,
                    width: 44.w,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
