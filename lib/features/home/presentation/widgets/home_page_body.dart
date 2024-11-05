import 'package:clinic/core/util/constants.dart';
import 'package:clinic/core/util/widgets/custom_button.dart';
import 'package:clinic/features/home/presentation/manager/cubit/order_cubit.dart';
import 'package:clinic/features/home/presentation/widgets/home_text_field.dart';
import 'package:clinic/features/home/presentation/widgets/lable_orders.dart';
import 'package:clinic/features/home/presentation/widgets/order_items.dart';
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
            child: CircularProgressIndicator(),
          );
        } else if (state is OrderLoaded) {
          final order = state.orders;
          return RefreshIndicator(
            onRefresh: () async {
              context.read<OrderCubit>().fetchOrders();
            },
            color:AppColor.primaryColor,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Column(
                  children: [
                    const HomeSearchTextFiled(),
                    Padding(
                      padding: EdgeInsets.only(top: 24.h),
                      child: const LableOrders(
                        text: 'طلبات اليوم',
                        padding: 200,
                      ),
                    ),
                     OrderItems(order:order ,),
                    const LableOrders(
                      text: 'سجل الطلبات السابقة',
                      padding: 120,
                    ),
                    OrderItems(order:order ,),
                  ],
                ),
              ),
            ),
          );
        }
        else if (state is OrderError) {
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
        } 
        else {
          return const Center(child: Text('لم يتم العثور على طلبات.'));
        }
      },
    );
  }
}
