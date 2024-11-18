import 'package:clinic/core/util/constants.dart';
import 'package:clinic/core/util/functions/navigator.dart';
import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/presentation/pages/order_detailes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class OrderDoctorItem extends StatelessWidget {
  const OrderDoctorItem({
    super.key,
    required this.order,
  });
  final Order order;
  @override
  Widget build(BuildContext context) {
    String dateTime = order.date.toString();
    var parts = dateTime.split(' ');
    String date = parts[0];
    // String timefake = parts[1];
    // var partTime = timefake.split('.');
    // String time = partTime[0];
    DateTime time = order.date;
    String formattedTime = DateFormat('hh:mm a').format(time);
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h, left: 16.w, right: 16.w),
      child: InkWell(
        onTap: () {
          Moving.navToPage(context: context, page: OrderDetailes(data: order));
        },
        child: SizedBox(
          height: 67.h,
          width: 361.w,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 3,
                  offset: const Offset(0.5, 1), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.w, top: 10.h),
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.start,
                        order.patientName,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        textAlign: TextAlign.start,
                        formattedTime,
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: SvgPicture.asset(info_icon),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
