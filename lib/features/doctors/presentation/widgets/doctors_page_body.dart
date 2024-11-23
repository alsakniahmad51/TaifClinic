import 'package:clinic/core/util/constants.dart';
import 'package:clinic/features/doctors/presentation/manager/docotr_cubit/doctors_cubit.dart';
import 'package:clinic/features/doctors/presentation/widgets/doctor_item.dart';
import 'package:clinic/features/home/presentation/widgets/home_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsPageBody extends StatelessWidget {
  const DoctorsPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsCubit, DoctorsState>(
      builder: (context, state) {
        if (state is DoctorsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),
          );
        } else if (state is DoctorsLoaded) {
          final doctors = state.doctors;
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.h, right: 16.w, left: 16.w),
                  child: const SearchTextFiled(
                    hint: 'اسم الطبيب',
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      return DoctorItem(
                        doctor: doctors[index],
                      );
                    },
                  ),
                )
              ],
            ),
          );
        } else
          return Text('data');
      },
    );
  }
}
