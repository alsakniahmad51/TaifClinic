import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/presentation/widgets/header_table_orders_today.dart';
import 'package:clinic/features/home/presentation/widgets/orders_item.dart';
import 'package:clinic/features/home/presentation/widgets/table_row_orders_today.dart';
import 'package:clinic/features/home/presentation/widgets/table_row_orders_today_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersTodayPage extends StatelessWidget {
  final List<Order> allOrders;

  const OrdersTodayPage({super.key, required this.allOrders});

  @override
  Widget build(BuildContext context) {
    // الحصول على تاريخ اليوم الحالي
    final today = DateTime.now();

    // تصفية الطلبات الخاصة باليوم الحالي فقط
    final ordersToday = allOrders.where((order) {
      return order.date.year == today.year &&
          order.date.month == today.month &&
          order.date.day == today.day;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('طلبات اليوم'),
      ),
      body: ordersToday.isEmpty
          ? const Center(child: Text('لا توجد طلبات لليوم'))
          : Column(
              children: [
                const HeaderTableOrdersToday(),
                SizedBox(
                  height: 300.h,
                  child: ListView.builder(
                    itemCount: ordersToday.length,
                    itemBuilder: (context, index) {
                      return TableRowOrdersToday(data: ordersToday[index]);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
