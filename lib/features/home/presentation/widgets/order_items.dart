import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/presentation/widgets/oreders_day_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderItems extends StatelessWidget {
  const OrderItems({
    super.key,
    required this.order,
  });
  final List<Order> order;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: SizedBox(
        height: 200.h,
        child: ListView.builder(
          itemCount: order.length,
          itemBuilder: (context, index) {
            final data = order[index];
            return OredersDayItem(
              papatientName: data.patientName,
              type: data.type,
            );
          },
        ),
      ),
    );
  }
}
