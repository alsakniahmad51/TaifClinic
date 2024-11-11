import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/presentation/widgets/orders_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeOrdersTody extends StatelessWidget {
  const HomeOrdersTody({
    super.key,
    required this.order,
  });
  final List<Order> order;
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    // تصفية الطلبات الخاصة باليوم الحالي فقط
    final ordersToday = order.where((order) {
      return order.date.year == today.year &&
          order.date.month == today.month &&
          order.date.day == today.day;
    }).toList();
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: SizedBox(
        height: ordersToday.isEmpty
            ? 50.h
            : (ordersToday.length == 1 ? 100.h : 200.h),
        child: ordersToday.isEmpty
            ? Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 25.h),
                  child: Text(
                    "لا توجد طلبات لليوم",
                    style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                  ),
                ),
              )
            : ListView.builder(
                itemCount: ordersToday.length,
                itemBuilder: (context, index) {
                  final data = ordersToday[index];

                  // String dateTime = data.date.toString();
                  // var parts = dateTime.split(' ');

                  // String timefake = parts[1];
                  // var partTime = timefake.split('.');
                  // String time = partTime[0];
                  timeago.setLocaleMessages('ar', timeago.ArMessages());
                  String timePassed = timeago.format(data.date, locale: 'ar');
                  return OrdersItem(
                    data: data,
                    time: timePassed,
                  );
                },
              ),
      ),
    );
  }
}
