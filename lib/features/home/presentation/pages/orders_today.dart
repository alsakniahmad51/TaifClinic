import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/presentation/widgets/orders_item.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

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
          : ListView.builder(
              itemCount: ordersToday.length,
              itemBuilder: (context, index) {
                final syrianTime =
                    ordersToday[index].date.add(const Duration(hours: 3));
                timeago.setLocaleMessages('ar', timeago.ArMessages());
                String timePassed = timeago.format(syrianTime, locale: 'ar');

                return OrdersItem(data: ordersToday[index], time: timePassed);
              },
            ),
    );
  }
}


// TableRowOrdersToday(data: ordersToday[index])