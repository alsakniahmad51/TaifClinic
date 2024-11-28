import 'package:clinic/core/util/constants.dart';
import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryPage extends StatelessWidget {
  final List<Order> ordersToday;

  const SummaryPage(
      {super.key, required this.ordersToday, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    // حساب عدد الطلبات لكل نوع
    final Map<String, int> orderCounts = {
      'سيفالوماتريك': 0,
      'بانوراما': 0,
      'C.B.C.T': 0,
    };
    double totalPrice = 0;

    for (var order in ordersToday) {
      final typeName = order.detail!.type.typeName;
      orderCounts[typeName] = (orderCounts[typeName] ?? 0) + 1;
      totalPrice += order.detail!.price + order.output!.price;
    }
    String formattedPrice = (totalPrice % 1 == 0)
        ? totalPrice.toInt().toString()
        : totalPrice.toString();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'جدول الجرد:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Table(
                border: TableBorder.all(),
                columnWidths: const {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(1),
                },
                children: [
                  const TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'نوع الطلب',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'عدد الطلبات',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  ...orderCounts.entries.map((entry) {
                    return TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(entry.key),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(entry.value.toString()),
                        ),
                      ],
                    );
                  }),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 3.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'إجمالي الفواتير',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 52.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Center(
                        child: Text(
                          '$formattedPrice ل.س',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//  'إجمالي الفواتير: $totalPrice ل.س'