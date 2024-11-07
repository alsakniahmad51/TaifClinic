import 'package:clinic/core/util/constants.dart';
import 'package:clinic/core/util/functions/navigator.dart';
import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/presentation/pages/order_detailes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleListTile extends StatelessWidget {
  const TitleListTile({
    super.key,
    required this.data,
  });

  final Order data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.patientName,
          style: const TextStyle(fontWeight: FontWeight.w400),
        ),
        Text(
          data.type,
          style: TextStyle(
              fontSize: 13.sp, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
        SizedBox(
          height: 3.h,
        ),
        GestureDetector(
          onTap: () {
            Moving.navToPage(
                context: context,
                page: OrderDetailes(
                  data: data,
                ));
          },
          child: Row(
            children: [
              Text(
                'التفاصيل',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: AppColor.primaryColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.primaryColor),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 10,
                color: AppColor.primaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
