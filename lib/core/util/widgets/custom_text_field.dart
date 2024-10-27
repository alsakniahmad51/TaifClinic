import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.textEditingController,
    this.validator,
  });

  final String hint;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
            focusedBorder: outlineBorder(),
            hintText: hint,
            hintStyle: textStyle(),
            border: outlineBorder(),
          ),
          validator: validator,
        ),
      ),
    );
  }

  TextStyle textStyle() {
    return TextStyle(
        color: Colors.black,
        fontFamily: "Cairo",
        fontSize: 17.sp,
        fontWeight: FontWeight.w400);
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(6.r),
    );
  }
}
