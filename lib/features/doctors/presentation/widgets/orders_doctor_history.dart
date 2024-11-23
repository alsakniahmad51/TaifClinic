import 'dart:developer';

import 'package:clinic/core/util/constants.dart';
import 'package:clinic/features/doctors/presentation/manager/docotr_order_cubit/doctor_order_cubit.dart';
import 'package:clinic/features/doctors/presentation/widgets/doctor_detailes_body.dart';
import 'package:clinic/features/doctors/presentation/widgets/order_doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorOrdersHistory extends StatelessWidget {
  const DoctorOrdersHistory({
    super.key,
    required this.doctorId,
  });
  final int doctorId;
  @override
  Widget build(BuildContext context) {
    if (context.read<DoctorOrdersCubit>().state is DoctorOrdersInitial) {
      context.read<DoctorOrdersCubit>().fetchOrders(doctorId);
    }
    return BlocBuilder<DoctorOrdersCubit, DoctorOrdersState>(
      builder: (context, state) {
        if (state is DoctorOrdersLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),
          );
        } else if (state is DoctorOrdersLoaded) {
          final order = state.orders;
          return Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: ListView.builder(
              itemCount: order.length,
              itemBuilder: (context, index) {
                return OrderDoctorItem(
                  order: order[index],
                );
              },
            ),
          );
        } else if (state is DoctorOrdersError) {
          log(state.message);
          return Center(
            child: Text(
              'حدث خطأ: ${state.message}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
