import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/presentation/widgets/table_item_order_detailes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;

class DoctorOrderDetailes extends StatelessWidget {
  const DoctorOrderDetailes(
      {super.key, required this.data, required this.doctorName});
  final Order data;
  final String doctorName;
  @override
  Widget build(BuildContext context) {
    String dateTime = data.date.toString();
    var parts = dateTime.split(' ');
    String date = parts[0];
    // String timefake = parts[1];
    // var partTime = timefake.split('.');
    // String time = partTime[0];
    DateTime time = data.date;
    String formattedTime = intl.DateFormat('hh:mm a').format(time);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'معلومات الطلب',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 34.h),
          child: Column(
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
                value: doctorName,
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
                value: "${data.detail!.price} ل.س",
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
          ),
        ),
      ),
    );
  }
}
