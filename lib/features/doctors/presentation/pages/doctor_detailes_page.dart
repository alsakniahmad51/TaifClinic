import 'package:clinic/features/doctors/domain/entities/doctor.dart';
import 'package:clinic/features/doctors/presentation/widgets/doctor_detailes_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl; // لعرض التواريخ بطريقة مناسبة
import 'package:clinic/features/doctors/domain/entities/doctor.dart';
import 'package:clinic/features/doctors/presentation/pages/doctor_info_page.dart';
import 'package:clinic/features/doctors/presentation/pages/orders_doctor_history_page.dart';

class DoctorDetailes extends StatelessWidget {
  const DoctorDetailes({super.key, required this.doctor});
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "تفاصيل الطبيب",
              style: TextStyle(color: Colors.black, fontSize: 18.sp),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.calendar_month, color: Colors.green),
                onPressed: () async {
                  final DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020), // الحد الأدنى للتاريخ
                    lastDate: DateTime.now(), // الحد الأقصى للتاريخ
                  );

                  if (selectedDate != null) {
                    // تمرير الشهر والسنة إلى صفحة الطلبات
                    final selectedMonth = selectedDate.month;
                    final selectedYear = selectedDate.year;
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DoctorOrdersHistory(
                          doctorId: doctor.id,
                          doctorName: doctor.name,
                          selectedMonth: selectedMonth,
                          selectedYear: selectedYear,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
            bottom: TabBar(
              indicatorColor: Colors.green,
              labelColor: Colors.green,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  child: Text(
                    "معلومات الطبيب",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                Tab(
                  child: Text(
                    "سجل الطلبات",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              DoctorInfo(doctor: doctor),
              DoctorOrdersHistory(
                doctorId: doctor.id,
                doctorName: doctor.name,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<DateTime?> showMonthYearPicker({
    required BuildContext context,
    required DateTime initialDate,
  }) async {
    DateTime? selectedDate;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        int selectedMonth = initialDate.month;
        int selectedYear = initialDate.year;

        return AlertDialog(
          title: const Text("اختر الشهر والسنة"),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<int>(
                value: selectedMonth,
                items: List.generate(12, (index) {
                  final month = index + 1;
                  return DropdownMenuItem<int>(
                    value: month,
                    child: Text(
                        intl.DateFormat.MMMM('ar').format(DateTime(0, month))),
                  );
                }),
                onChanged: (value) {
                  if (value != null) {
                    selectedMonth = value;
                  }
                },
              ),
              DropdownButton<int>(
                value: selectedYear,
                items: List.generate(
                    10,
                    (index) => DropdownMenuItem(
                        value: 2020 + index, child: Text('${2020 + index}'))),
                onChanged: (value) {
                  if (value != null) {
                    selectedYear = value;
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                selectedDate = DateTime(selectedYear, selectedMonth);
                Navigator.of(context).pop();
              },
              child: const Text("تأكيد"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("إلغاء"),
            ),
          ],
        );
      },
    );
    return selectedDate;
  }
}
