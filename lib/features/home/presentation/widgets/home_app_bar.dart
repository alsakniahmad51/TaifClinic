import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  final void Function(DateTime selectedDate)
      onDateSelected; // وظيفة تمرير التاريخ
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
            icon: const Icon(Icons.calendar_today, color: Color(0xff6a6a6a)),
            onPressed: () async {
              // اختيار الشهر والسنة
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000), // بداية المدى
                lastDate: DateTime(2100), // نهاية المدى
              );
              if (selectedDate != null) {
                // تمرير التاريخ المختار
                onDateSelected(selectedDate);
              }
            },
          ),
          Text(
            "!أهلاً وسهلاً",
            style: TextStyle(
                fontSize: 18.sp,
                color: const Color(0xff6a6a6a),
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
