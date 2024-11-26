import 'package:clinic/core/util/constants.dart';
import 'package:clinic/features/doctors/domain/entities/doctor.dart';
import 'package:clinic/features/doctors/presentation/widgets/custom_doctor_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({
    super.key,
    required this.doctor,
  });
  final Doctor doctor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 350.h, top: 20.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(2, 2), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 18.w, top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDoctorInfo(
                title: 'الاسم',
                value: doctor.name,
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.h, right: 65.w, bottom: 25.h),
                child: SvgPicture.asset(
                  line,
                ),
              ),
              CustomDoctorInfo(
                title: 'رقم الهاتف',
                value: doctor.phoneNumber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
