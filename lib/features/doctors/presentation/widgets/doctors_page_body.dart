import 'package:clinic/core/util/constants.dart';
import 'package:clinic/features/doctors/presentation/manager/docotr_cubit/doctors_cubit.dart';
import 'package:clinic/features/doctors/presentation/widgets/doctor_item.dart';
import 'package:clinic/features/home/presentation/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorsPageBody extends StatelessWidget {
  const DoctorsPageBody({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();

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
                  child: SearchTextFiled(
                    suffix: const Icon(Icons.search),
                    prefix: InkWell(
                      child: SvgPicture.asset(
                        filter,
                        fit: BoxFit.none,
                      ),
                    ),
                    textEditingController: search,
                    onChanged: (query) {
                      context.read<DoctorsCubit>().searchDoctors(query);
                    },
                    hint: 'اسم الطبيب',
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      return DoctorItem(
                        doctor: doctors[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (state is DoctorsError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('لا يوجد بيانات'));
        }
      },
    );
  }
}



///  