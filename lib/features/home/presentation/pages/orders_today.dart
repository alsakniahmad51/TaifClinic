import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/presentation/widgets/oreders_day_item.dart';
import 'package:flutter/material.dart';

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
        title: const Text('طلبات اليوم'),
      ),
      body: ordersToday.isEmpty
          ? const Center(child: Text('لا توجد طلبات لليوم'))
          : ListView.builder(
              itemCount: ordersToday.length,
              itemBuilder: (context, index) {
                return OredersDayItem(data: ordersToday[index]);
              },
            ),
    );
  }
}
