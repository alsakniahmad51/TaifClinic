import 'package:clinic/core/util/constants.dart';
import 'package:clinic/core/util/functions/navigator.dart';
import 'package:clinic/features/doctors/presentation/pages/doctor_order_detailes.dart';
import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:intl/intl.dart';

class OrderDoctorItem extends StatelessWidget {
  const OrderDoctorItem({
    super.key,
    required this.order,
    required this.doctorName,
  });
  final Order order;
  final String doctorName;
  @override
  Widget build(BuildContext context) {
    String dateTime = order.date.toString();
    var parts = dateTime.split(' ');
    String date = parts[0];
    // DateTime time = order.date;
    // String formattedTime = DateFormat('hh:mm a').format(time);
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 16.w, right: 16.w),
      child: InkWell(
        onTap: () {
          Moving.navToPage(
              context: context,
              page: DoctorOrderDetailes(
                order: order,
                doctorName: doctorName,
              ));
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
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: const Offset(1, 1), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.w, top: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        date,
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
