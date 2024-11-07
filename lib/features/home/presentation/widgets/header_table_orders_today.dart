import 'package:clinic/features/home/presentation/widgets/header_table_orders_today_cell.dart';
import 'package:flutter/material.dart';

class HeaderTableOrdersToday extends StatelessWidget {
  const HeaderTableOrdersToday({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeaderTableOrdersTodayCell(
            title: 'اسم المريض',
          ),
          HeaderTableOrdersTodayCell(
            title: 'اسم الطبيب',
          ),
          HeaderTableOrdersTodayCell(
            title: 'نوع الصورة',
          ),
          HeaderTableOrdersTodayCell(
            title: 'التفاصيل',
          ),
        ],
      ),
    );
  }
}
