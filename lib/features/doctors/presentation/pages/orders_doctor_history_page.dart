import 'dart:developer';

import 'package:clinic/core/util/constants.dart';
import 'package:clinic/features/doctors/presentation/manager/docotr_order_cubit/doctor_order_cubit.dart';
import 'package:clinic/features/doctors/presentation/widgets/order_doctor_item.dart';
import 'package:clinic/features/home/presentation/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorOrdersHistory extends StatelessWidget {
  const DoctorOrdersHistory({
    super.key,
    required this.doctorId,
    required this.doctorName,
    this.selectedMonth,
    this.selectedYear,
  });
  final int doctorId;
  final String doctorName;
  final int? selectedMonth;
  final int? selectedYear;
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();

    // الحصول على الشهر والسنة الحاليين إذا لم يتم تحديدهما
    final currentDate = DateTime.now();
    final month = selectedMonth ?? currentDate.month;
    final year = selectedYear ?? currentDate.year;

    if (context.read<DoctorOrdersCubit>().state is DoctorOrdersInitial ||
        context.read<DoctorOrdersCubit>().state is DoctorOrdersLoaded) {
      context.read<DoctorOrdersCubit>().fetchOrders(doctorId, month, year);
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
          final orders = state.orders;
          orders.sort((a, b) => b.date.compareTo(a.date));
          return RefreshIndicator(
            backgroundColor: Colors.white,
            color: AppColor.primaryColor,
            onRefresh: () {
              return context
                  .read<DoctorOrdersCubit>()
                  .fetchOrders(doctorId, month, year);
            },
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                SearchTextFiled(
                  prefix: const Icon(Icons.search),
                  textEditingController: search,
                  hint: 'ابحث عن اسم المريض',
                  onChanged: (query) {
                    context.read<DoctorOrdersCubit>().searchOrders(query);
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      return OrderDoctorItem(
                        order: orders[index],
                        doctorName: doctorName,
                      );
                    },
                  ),
                ),
              ],
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
//  