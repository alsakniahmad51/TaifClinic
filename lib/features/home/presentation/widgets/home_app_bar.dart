import 'package:clinic/core/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:month_year_picker/month_year_picker.dart';

class HomeAppBar extends StatelessWidget {
  final void Function(DateTime selectedDate) onDateSelected;

  const HomeAppBar({
    super.key,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w, bottom: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: SvgPicture.asset(calendar),
            onPressed: () async {
              final selectedDate = await myAppMonthYearPicker(context);

              if (selectedDate != null) {
                onDateSelected(selectedDate);
              }
            },
          ),
          Text(
            "!أهلاً وسهلاً",
            style: TextStyle(
              fontSize: 18.sp,
              color: const Color(0xff6a6a6a),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Future<DateTime?> myAppMonthYearPicker(BuildContext context) {
    return showMonthYearPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme:
                const ColorScheme.light(primary: AppColor.primaryColor),
            dialogBackgroundColor: Colors.white,
            textTheme: TextTheme(
              bodyMedium: TextStyle(fontSize: 16.sp),
            ),
          ),
          child: child!,
        );
      },
    );
  }
}
