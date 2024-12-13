import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeftRowItemWithBorder extends StatelessWidget {
  const LeftRowItemWithBorder({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffE4F3E5),
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
