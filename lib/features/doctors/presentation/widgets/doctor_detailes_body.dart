import 'package:clinic/core/util/constants.dart';
import 'package:clinic/features/doctors/domain/entities/doctor.dart';
import 'package:clinic/features/doctors/presentation/widgets/doctor_info.dart';
import 'package:clinic/features/doctors/presentation/widgets/orders_doctor_history.dart';
import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorDetailesBody extends StatelessWidget {
  const DoctorDetailesBody({
    super.key,
    required this.doctor,
  });
  final Doctor doctor;
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        DoctorInfo(
          doctor: doctor,
        ),
        DoctorOrdersHistory(
          doctorId: doctor.id,
        ),
      ],
    );
  }
}
