import 'package:clinic/features/home/presentation/widgets/home_text_field.dart';
import 'package:clinic/features/home/presentation/widgets/lable_orders.dart';
import 'package:clinic/features/home/presentation/widgets/order_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            const HomeSearchTextFiled(),
            Padding(
              padding: EdgeInsets.only(top: 24.h),
              child: const LableOrders(
                text: 'طلبات اليوم',
                padding: 200,
              ),
            ),
            const OrderItems(),
            const LableOrders(
              text: 'سجل الطلبات السابقة',
              padding: 120,
            ),
            const OrderItems(),
          ],
        ),
      ),
    );
  }
}
