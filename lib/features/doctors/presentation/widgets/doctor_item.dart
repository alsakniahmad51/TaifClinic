import 'package:clinic/core/util/constants.dart';
import 'package:clinic/core/util/functions/navigator.dart';
import 'package:clinic/features/doctors/domain/entities/doctor.dart';
import 'package:clinic/features/doctors/presentation/pages/doctor_detailes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({
    super.key,
    required this.doctor,
  });
  final Doctor doctor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: InkWell(
          onTap: () {
            Moving.navToPage(
                context: context,
                page: DoctorDetailes(
                  doctor: doctor,
                ));
          },
          child: SizedBox(
            height: 70.h,
            child: Card(
              margin: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: ListTile(
                trailing: Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: Colors.grey,
                  ),
                ),
                title: Padding(
                  padding: EdgeInsets.only(top: 7.h),
                  child: Text(
                    doctor.name,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                  ),
                ),
                leading: Padding(
                  padding: EdgeInsets.only(top: 15.h),
                  child: SvgPicture.asset(
                    person,
                    height: 44.h,
                    width: 44.w,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
