import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableRowOrdersTodayCell extends StatelessWidget {
  const TableRowOrdersTodayCell({super.key, this.childCell});
  final Widget? childCell;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.h,
      width: 90.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffE4F3E5),
        ),
      ),
      child: Center(
        child: childCell,
      ),
    );
  }
}
