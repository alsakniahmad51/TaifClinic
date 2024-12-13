import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/presentation/widgets/left_row_item_with_border.dart';
import 'package:clinic/features/home/presentation/widgets/right_row_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;

class SummaryPage extends StatelessWidget {
  final List<Order> ordersToday;

  const SummaryPage({
    super.key,
    required this.ordersToday,
    required this.title,
    required this.doctorName,
  });

  final String title;
  final String doctorName;

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
    final formattedPrice = intl.NumberFormat("#,###", "ar").format(totalPrice);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Column(
            children: [
              Text(title),
              SizedBox(
                height: 5.h,
              ),
              Text(
                doctorName,
                style: TextStyle(fontSize: 16.sp),
              )
            ],
          ),
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
                // border: TableBorder.all(color: Colors.black, width: 1),
                columnWidths: const {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(2),
                },
                children: [
                  TableRow(
                    children: [
                      RightRowItem(
                        topRadius: 8.r,
                        child: const Text(
                          'نوع الطلب',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const LeftRowItemWithBorder(
                        child: Text(
                          'عدد الطلبات',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  ...orderCounts.entries.map((entry) {
                    return TableRow(
                      children: [
                        Container(
                          height: 40.h,
                          decoration: const BoxDecoration(
                            color: Color(0xffE4F3E5),
                          ),
                          child: Center(
                            child: Text(
                              entry.key,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        LeftRowItemWithBorder(
                            child: Text(
                          entry.value.toString(),
                          textAlign: TextAlign.center,
                        )),
                      ],
                    );
                  }),
                  TableRow(
                    children: [
                      RightRowItem(
                          bottomRadius: 8.r,
                          child: const Text(
                            'إجمالي الفواتير',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                      LeftRowItemWithBorder(
                          child: Text(
                        '$formattedPrice ل.س',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
