// ignore_for_file: library_private_types_in_public_api

import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/presentation/widgets/home_text_field.dart';
import 'package:clinic/features/home/presentation/widgets/orders_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersHistoryPage extends StatefulWidget {
  final List<Order> allOrders;

  const OrdersHistoryPage({super.key, required this.allOrders});

  @override
  _OrdersHistoryPageState createState() => _OrdersHistoryPageState();
}

class _OrdersHistoryPageState extends State<OrdersHistoryPage> {
  List<Order> filteredOrders = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredOrders = widget.allOrders; // جميع الطلبات بشكل افتراضي
  }

  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  void _filterOrders(String query) {
    setState(() {
      filteredOrders = widget.allOrders
          .where((order) =>
              order.patientName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    filteredOrders.sort((a, b) => b.date.compareTo(a.date));
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: const Text('سجل الطلبات'),
      ),
      body: widget.allOrders.isEmpty
          ? const Center(
              child: Text('لا توجد طلبات حالياً'),
            )
          : Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: SearchTextFiled(
                    textEditingController: searchController,
                    hint: 'ابحث عن اسم المريض',
                    onChanged: _filterOrders,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredOrders.length,
                    itemBuilder: (context, index) {
                      String dateTime = filteredOrders[index].date.toString();
                      var parts = dateTime.split(' ');
                      String date = parts[0];
                      return OrdersItem(
                        data: filteredOrders[index],
                        time: date,
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
