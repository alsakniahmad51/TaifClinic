import 'package:clinic/core/util/constants.dart';
import 'package:clinic/core/util/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchTextFiled extends StatelessWidget {
  const SearchTextFiled({
    super.key,
    required this.hint,
    this.onChanged,
    this.focusNode,
    this.textEditingController,
    this.enabled,
    this.onTap,
  });

  final String hint;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final TextEditingController? textEditingController;
  final bool? enabled;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF6F7F7),
        borderRadius: BorderRadius.all(
          Radius.circular(12.r),
        ),
      ),
      child: CustomTextField(
        focusNode: focusNode,
        enabled: enabled,
        focuseColor: AppColor.primaryColor,
        prefix: InkWell(
          onTap: onTap,
          child: SvgPicture.asset(
            filter,
            fit: BoxFit.none,
          ),
        ),
        suffix: const Icon(Icons.search),
        title: hint,
        radius: 12.r,
        textEditingController: textEditingController ?? TextEditingController(),
        keyboardType: TextInputType.text,
        onSearch: onChanged, // تمرير حدث البحث
      ),
    );
  }
}
