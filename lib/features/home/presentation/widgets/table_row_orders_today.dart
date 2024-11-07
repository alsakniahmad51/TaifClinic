import 'package:clinic/core/util/functions/navigator.dart';
import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/presentation/pages/order_detailes.dart';
import 'package:clinic/features/home/presentation/widgets/table_row_orders_today_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableRowOrdersToday extends StatelessWidget {
  const TableRowOrdersToday({super.key, required this.data});
  final Order data;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TableRowOrdersTodayCell(
            childCell: Text(
              data.patientName,
              style: styleTableText(),
            ),
          ),
          TableRowOrdersTodayCell(
            childCell: Text(
              data.doctorName,
              style: styleTableText(),
            ),
          ),
          TableRowOrdersTodayCell(
            childCell: Text(
              data.examinationOptions ?? "",
              style: styleTableText(),
            ),
          ),
          TableRowOrdersTodayCell(
            childCell: GestureDetector(
              onTap: () {
                Moving.navToPage(
                    context: context, page: OrderDetailes(data: data));
              },
              child: const Icon(
                Icons.info_outline_rounded,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle styleTableText() =>
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400);
}
