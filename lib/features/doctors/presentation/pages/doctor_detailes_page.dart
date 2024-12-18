import 'package:clinic/core/util/constants.dart';
import 'package:clinic/features/doctors/domain/entities/doctor.dart';
import 'package:clinic/features/doctors/presentation/pages/doctor_info_page.dart';
import 'package:clinic/features/doctors/presentation/pages/orders_doctor_history_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:month_year_picker/month_year_picker.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({
    super.key,
    required this.doctor,
  });

  final Doctor doctor;

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  int? selectedMonth;
  int? selectedYear;

  void _updateDate(DateTime selectedDate) {
    setState(() {
      selectedMonth = selectedDate.month;
      selectedYear = selectedDate.year;
    });
  }

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
                icon: SvgPicture.asset(calendar),
                onPressed: () async {
                  final DateTime? pickedDate =
                      await _showMonthYearPicker(context);
                  if (pickedDate != null) {
                    _updateDate(pickedDate);
                  }
                },
              ),
            ],
            bottom: TabBar(
              overlayColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.pressed)) {
                    return Colors.green[100]; // اللون عند النقر
                  }
                  return null; // بدون تأثير إضافي
                },
              ),
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
              DoctorInfo(doctor: widget.doctor),
              DoctorOrdersHistory(
                selectedYear: selectedYear,
                selectedMonth: selectedMonth,
                doctorId: widget.doctor.id,
                doctorName: widget.doctor.name,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<DateTime?> _showMonthYearPicker(BuildContext context) {
    return showMonthYearPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme:
                const ColorScheme.light(primary: AppColor.primaryColor),
            dialogBackgroundColor: Colors.white,
            textTheme: TextTheme(
              bodyMedium: TextStyle(fontSize: 16.sp),
            ),
          ),
          child: child!,
        );
      },
    );
  }
}
