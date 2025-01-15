// ignore_for_file: use_build_context_synchronously

import 'package:clinic/core/util/constants.dart';
import 'package:clinic/core/util/widgets/custom_text_field.dart';
import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/presentation/manager/fetch_order_cubit/order_cubit.dart';
import 'package:clinic/features/home/presentation/manager/update_price_order_cubit/update_order_cubit.dart';
import 'package:clinic/features/home/presentation/manager/update_state_order_cubit/update_state_order_cubit.dart';
import 'package:clinic/features/home/presentation/pages/page_view.dart';
import 'package:clinic/features/home/presentation/widgets/detailes_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;

class OrderDetailes extends StatelessWidget {
  const OrderDetailes({
    super.key,
    required this.order,
  });
  final Order order;

  @override
  Widget build(BuildContext context) {
    String dateTime = order.date.toString();
    var parts = dateTime.split(' ');
    String date = parts[0];
    DateTime time = order.date;
    String formattedTime = intl.DateFormat('hh:mm a').format(time);

    return MultiBlocListener(
      listeners: [
        BlocListener<UpdateStateOrderCubit, UpdateStateOrderState>(
          listener: (context, state) {
            if (state is UpdateStateOrderLoading) {
              // ✅ إظهار Loading Dialog
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is UpdateStateOrderSucsecc) {
              // ✅ إغلاق Loading Dialog
              Navigator.of(context).pop();

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تم تأكيد عملية التصوير بنجاح!'),
                  backgroundColor: Colors.green,
                ),
              );

              final now = DateTime.now();
              final startOfMonth = DateTime(now.year, now.month, 1);
              final endOfMonth = DateTime(now.year, now.month + 1, 0);
              context.read<OrderCubit>().fetchOrders(startOfMonth, endOfMonth);

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Pageview()),
                (Route<dynamic> route) => false,
              );
            } else if (state is UpdateStateOrderFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('فشلت عملية تأكيد التصوير!'),
                  backgroundColor: Colors.red,
                ),
              );
              // ✅ إغلاق Loading Dialog
              Navigator.of(context).pop();
            }
          },
        ),
        BlocListener<UpdatePriceOrderCubit, UpdateOrderState>(
          listener: (context, state) {
            if (state is UpdateOrderLoading) {
              // ✅ إظهار Loading Dialog
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is UpdateOrderSuccess) {
              // ✅ إغلاق Loading Dialog
              Navigator.of(context).pop();

              final now = DateTime.now();
              final startOfMonth = DateTime(now.year, now.month, 1);
              final endOfMonth = DateTime(now.year, now.month + 1, 0);
              context.read<OrderCubit>().fetchOrders(startOfMonth, endOfMonth);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تم تحديث السعر بنجاح!'),
                  backgroundColor: Colors.green,
                ),
              );

              // ✅ الانتقال إلى الصفحة الرئيسية مع إزالة كل الصفحات السابقة
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Pageview()),
                (Route<dynamic> route) => false,
              );
            } else if (state is UpdateOrderError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('فشل تحديث السعر!'),
                  backgroundColor: Colors.red,
                ),
              );

              Navigator.of(context).pop();
            }
          },
        ),
      ],
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            forceMaterialTransparency: true,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              'معلومات الطلب',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// ✅ **تفاصيل الطلب**
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DetailesTable(
                      order: order,
                      date: date,
                      formattedTime: formattedTime,
                    ),
                  ),
                  SizedBox(height: 40.h),

                  if (!order.isImaged)
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () => _confirmImaging(context),
                          icon: const Icon(Icons.check_circle,
                              color: Colors.white),
                          label: const Text(
                            'تأكيد عملية التصوير',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primaryColor,
                            minimumSize: Size(double.infinity, 50.h),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 20.h),

                  if (!order.isImaged)
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () => _showEditPriceSheet(context),
                          icon: const Icon(Icons.discount, color: Colors.white),
                          label: const Text(
                            'إضافة حسم',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.teal, // لون متناسق مع التصميم
                            minimumSize: Size(double.infinity, 50.h),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 30.h),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: order.isImaged
                          ? Colors.green.shade100
                          : Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          order.isImaged
                              ? Icons.check_circle
                              : Icons.access_time_filled,
                          color: order.isImaged ? Colors.green : Colors.amber,
                          size: 24.w,
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            order.isImaged
                                ? 'تم إتمام عملية تصوير الأشعة بنجاح.'
                                : 'بانتظار وصول المريض لاستكمال إجراءات الطلب.',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: order.isImaged
                                  ? Colors.green.shade800
                                  : Colors.amber.shade800,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _confirmImaging(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Text('تأكيد عملية التصوير'),
          content: const Text(
              'هل أنت متأكد من تأكيد عملية التصوير؟ هذا الإجراء نهائي.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<UpdateStateOrderCubit>(context)
                    .updateOrderState(order.id);

                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
              ),
              child: const Text(
                'تأكيد',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditPriceSheet(BuildContext context) {
    final TextEditingController priceController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
          top: 20.h,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'إضافة حسم للطلب',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                enableColor: AppColor.primaryColor,
                focuseColor: AppColor.primaryColor,
                title: 'أدخل قيمة الحسم',
                radius: 8.0.r,
                textEditingController: priceController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يجب ألا يكون الحقل فارغًا';
                  }
                  // التحقق من أن القيمة رقمية
                  final int? discount = int.tryParse(value);
                  if (discount == null) {
                    return 'يجب إدخال قيمة رقمية صالحة';
                  }
                  // التحقق من أن الحسم أقل من سعر الطلب
                  if (discount >= order.price) {
                    return 'يجب ألا يكون الحسم أكبر من أو يساوي الفاتورة';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                ),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    final newDiscount = int.tryParse(priceController.text);

                    if (newDiscount != null) {
                      final newPrice = order.price - newDiscount;

                      BlocProvider.of<UpdatePriceOrderCubit>(context)
                          .updateOrderPrice(order.id, newPrice);

                      Navigator.of(context).pop();
                    }
                  }
                },
                child: const Text('تأكيد التعديل'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
