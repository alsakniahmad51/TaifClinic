import 'package:clinic/features/home/presentation/widgets/left_row_item_with_border.dart';
import 'package:clinic/features/home/presentation/widgets/right_row_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryPageBody extends StatelessWidget {
  const SummaryPageBody({
    super.key,
    required this.orderCounts,
    required this.formattedPrice,
    required this.date,
  });

  final Map<String, int> orderCounts;
  final String formattedPrice;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'جدول الجرد لشهر $date:',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Table(
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
    );
  }
}
