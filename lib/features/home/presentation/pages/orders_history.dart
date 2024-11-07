import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/presentation/widgets/oreders_day_item.dart';
import 'package:flutter/material.dart';

class AllOrdersPage extends StatelessWidget {
  final List<Order> allOrders;

  const AllOrdersPage({super.key, required this.allOrders});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('جميع الطلبات'),
      ),
      body: allOrders.isEmpty
          ? const Center(
              child: Text('لا توجد طلبات حالياً'),
            )
          : ListView.builder(
              itemCount: allOrders.length,
              itemBuilder: (context, index) {
                return OredersDayItem(data: allOrders[index]);
              },
            ),
    );
  }
}
