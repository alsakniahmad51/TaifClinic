// ignore_for_file: use_build_context_synchronously

import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/presentation/widgets/table_item_order_detailes.dart';
import 'package:flutter/material.dart';

class DetailesTable extends StatelessWidget {
  const DetailesTable({
    super.key,
    required this.data,
    required this.date,
    required this.formattedTime,
  });

  final Order data;
  final String date;
  final String formattedTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableItem(
          title: 'اسم المريض',
          value: data.patientName,
          topradius: 12,
          buttomradius: 0,
        ),
        TableItem(
          title: 'العمر',
          value: "${data.patientAge}",
          topradius: 0,
          buttomradius: 0,
        ),
        TableItem(
          title: 'رقم هاتف المريض',
          value: "${data.phoneNumber}",
          topradius: 0,
          buttomradius: 0,
        ),
        TableItem(
          title: 'اسم الطبيب',
          value: data.doctorName,
          topradius: 0,
          buttomradius: 0,
        ),
        TableItem(
          title: 'نوع الصورة',
          value: data.detail!.type.typeName,
          topradius: 0,
          buttomradius: 0,
        ),
        if (data.detail!.option.optionName != "لا يوجد")
          TableItem(
            title: 'الجزء المراد تصويره',
            value: data.detail!.option.optionName,
            topradius: 0,
            buttomradius: 0,
          ),
        if (data.detail!.option.optionName == 'ساحة 5*5 مميزة للبية')
          TableItem(
            title: 'رقم السن',
            value: data.toothNumber.toString(),
            topradius: 0,
            buttomradius: 0,
          ),
        if (data.detail!.mode.modeName != "لا يوجد")
          TableItem(
            title: 'وضعية الصورة',
            value: data.detail!.mode.modeName,
            topradius: 0,
            buttomradius: 0,
          ),
        if (data.detail!.type.typeName != "C.B.C.T")
          TableItem(
            title: 'شكل الصورة',
            value: data.output!.type,
            topradius: 0,
            buttomradius: 0,
          ),
        TableItem(
          title: 'التاريخ',
          value: date,
          topradius: 0,
          buttomradius: 0,
        ),
        TableItem(
          title: 'التوقيت',
          value: formattedTime,
          topradius: 0,
          buttomradius: 0,
        ),
        TableItem(
          title: 'قيمة الفاتورة',
          value: "${data.price} ل.س",
          topradius: 0,
          buttomradius: 0,
        ),
        TableItem(
          title: 'ملاحظات',
          value: data.additionalNotes ?? "",
          topradius: 0,
          buttomradius: 12,
        ),
      ],
    );
  }
}
