import 'package:clinic/core/util/constants.dart';
import 'package:clinic/core/util/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeSearchTextFiled extends StatelessWidget {
  const HomeSearchTextFiled({
    super.key,
    required this.hint,
  });
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(
          Radius.circular(12.r),
        ),
      ),
      child: CustomTextField(
        focuseColor: AppColor.primaryColor,
        prefix: SvgPicture.asset(
          filter,
          fit: BoxFit.none,
        ),
        suffix: const Icon(Icons.search),
        title: hint,
        radius: 12.r,
        textEditingController: TextEditingController(),
        keyboardType: TextInputType.text,
      ),
    );
  }
}
