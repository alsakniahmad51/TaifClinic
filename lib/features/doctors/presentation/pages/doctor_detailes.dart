import 'package:clinic/features/doctors/domain/entities/doctor.dart';
import 'package:clinic/features/doctors/presentation/widgets/doctor_detailes_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            bottom: TabBar(
              indicatorColor: Colors.green,
              labelColor: Colors.green,
              unselectedLabelColor: Colors.grey,
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.green[100]; // اللون عند النقر
                  }
                  return null; // بدون تأثير إضافي
                },
              ),
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
          body: DoctorDetailesBody(
            doctor: doctor,
          ),
        ),
      ),
    );
  }
}
