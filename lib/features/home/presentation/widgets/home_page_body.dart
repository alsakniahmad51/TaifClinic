import 'package:clinic/core/util/constants.dart';
import 'package:clinic/core/util/functions/navigator.dart';
import 'package:clinic/features/home/presentation/manager/cubit/order_cubit.dart';
import 'package:clinic/features/home/presentation/pages/orders_history.dart';
import 'package:clinic/features/home/presentation/pages/orders_today.dart';
import 'package:clinic/features/home/presentation/widgets/home_app_bar.dart';
import 'package:clinic/features/home/presentation/widgets/home_orders_history.dart';
import 'package:clinic/features/home/presentation/widgets/home_orders_today.dart';
import 'package:clinic/features/home/presentation/widgets/home_text_field.dart';
import 'package:clinic/features/home/presentation/widgets/lable_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),
          );
        } else if (state is OrderLoaded) {
          final orders = state.orders;
          orders.sort((a, b) => b.date.compareTo(a.date));
          return RefreshIndicator(
            color: AppColor.primaryColor,
            onRefresh: () async {
              final now = DateTime.now();
              final startOfMonth = DateTime(now.year, now.month, 1);
              final endOfMonth = DateTime(now.year, now.month + 1, 0);
              context.read<OrderCubit>().fetchOrders(startOfMonth, endOfMonth);
            },
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    HomeAppBar(
                      onDateSelected: (selectedDate) {
                        final startOfMonth =
                            DateTime(selectedDate.year, selectedDate.month, 1);
                        final endOfMonth = DateTime(
                            selectedDate.year, selectedDate.month + 1, 0);
                        context
                            .read<OrderCubit>()
                            .fetchOrders(startOfMonth, endOfMonth);
                      },
                    ),
                    InkWell(
                      onTap: () {
                        Moving.navToPage(
                            context: context,
                            page: OrdersHistoryPage(
                              allOrders: orders,
                            ));
                      },
                      child: const SearchTextFiled(
                        enabled: false,
                        hint: "مريض, تصوير مقطعي",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 24.h),
                      child: LableOrders(
                        onTap: () {
                          Moving.navToPage(
                            context: context,
                            page: OrdersTodayPage(
                              allOrders: orders,
                            ),
                          );
                        },
                        text: 'طلبات اليوم',
                        padding: 200,
                      ),
                    ),
                    HomeOrdersTody(
                      order: orders,
                    ),
                    LableOrders(
                      text: 'سجل الطلبات السابقة',
                      padding: 120,
                      onTap: () {
                        Moving.navToPage(
                            context: context,
                            page: OrdersHistoryPage(
                              allOrders: orders,
                            ));
                      },
                    ),
                    HomeOrdersHistory(
                      order: orders,
                    )
                  ],
                ),
              ),
            ),
          );
        } else if (state is OrderError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('حدث خطأ: ${state.message}'),
              ],
            ),
          );
        } else {
          return const Center(child: Text('لم يتم العثور على طلبات.'));
        }
      },
    );
  }
}
