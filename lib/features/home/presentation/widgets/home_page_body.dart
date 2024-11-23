import 'package:clinic/core/util/constants.dart';
import 'package:clinic/core/util/functions/navigator.dart';
import 'package:clinic/core/util/widgets/custom_button.dart';
import 'package:clinic/features/home/presentation/manager/cubit/order_cubit.dart';
import 'package:clinic/features/home/presentation/pages/orders_history.dart';
import 'package:clinic/features/home/presentation/pages/orders_today.dart';
import 'package:clinic/features/home/presentation/widgets/home_app_bar.dart';
import 'package:clinic/features/home/presentation/widgets/home_orders_history.dart';
import 'package:clinic/features/home/presentation/widgets/home_text_field.dart';
import 'package:clinic/features/home/presentation/widgets/lable_orders.dart';
import 'package:clinic/features/home/presentation/widgets/home_orders_today.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

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
          final order = state.orders;

          return RefreshIndicator(
            onRefresh: () async {
              context.read<OrderCubit>().fetchOrders();
            },
            color: AppColor.primaryColor,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Column(
                    children: [
                      const HomeAppBar(),
                      InkWell(
                        onTap: () {
                          Moving.navToPage(
                              context: context,
                              page: OrdersHistoryPage(
                                allOrders: order,
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
                                allOrders: order,
                              ),
                            );
                          },
                          text: 'طلبات اليوم',
                          padding: 200,
                        ),
                      ),
                      HomeOrdersTody(
                        order: order,
                      ),
                      LableOrders(
                        text: 'سجل الطلبات السابقة',
                        padding: 120,
                        onTap: () {
                          Moving.navToPage(
                              context: context,
                              page: OrdersHistoryPage(
                                allOrders: order,
                              ));
                        },
                      ),
                      HomeOrdersHistory(
                        order: order,
                      )
                    ],
                  ),
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
                SizedBox(height: 20.h),
                CustomButton(
                    title: "إعادة تحميل",
                    color: AppColor.primaryColor,
                    onTap: () async {
                      context.read<OrderCubit>().fetchOrders();
                    },
                    titleColor: Colors.white)
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
