// ignore_for_file: use_build_context_synchronously

import 'package:clinic/core/util/constants.dart';
import 'package:clinic/core/util/functions/navigator.dart';
import 'package:clinic/core/util/widgets/custom_text_field.dart';
import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/presentation/manager/fetch_order_cubit/order_cubit.dart';
import 'package:clinic/features/home/presentation/manager/update_price_order_cubit/update_order_cubit.dart';
import 'package:clinic/features/home/presentation/pages/page_view.dart';
import 'package:clinic/features/home/presentation/widgets/detailes_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;

class OrderDetailes extends StatelessWidget {
  const OrderDetailes({
    super.key,
    required this.data,
  });
  final Order data;

  @override
  Widget build(BuildContext context) {
    String dateTime = data.date.toString();
    var parts = dateTime.split(' ');
    String date = parts[0];
    DateTime time = data.date;
    String formattedTime = intl.DateFormat('hh:mm a').format(time);

    return Directionality(
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
            padding: EdgeInsets.only(top: 34.h),
            child: Column(
              children: [
                DetailesTable(
                    data: data, date: date, formattedTime: formattedTime),
                SizedBox(
                  height: 30.h,
                ),
                InkWell(
                  onTap: () {
                    _showEditPriceSheet(context);
                  },
                  child: Container(
                    height: 40.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: const Center(
                        child: Text(
                      'إضافة حسم',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showEditPriceSheet(BuildContext context) {
    final TextEditingController priceController =
        TextEditingController(); // يتحكم بحقل النص
    final formKey = GlobalKey<FormState>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // لضمان ملء الشاشة عند ظهور لوحة المفاتيح
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
                      final newPrice = data.price - newDiscount;

                      try {
                        await BlocProvider.of<UpdatePriceOrderCubit>(context)
                            .updateOrderPrice(data.id, newPrice);
                        Navigator.of(context).pop();
                        Moving.navToPage(
                            context: context, page: const Pageview());
                        final now = DateTime.now();
                        final startOfMonth = DateTime(now.year, now.month, 1);
                        final endOfMonth = DateTime(now.year, now.month + 1, 0);
                        BlocProvider.of<OrderCubit>(context)
                            .fetchOrders(startOfMonth, endOfMonth);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('فشل تحديث السعر: $e')),
                        );
                      }
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
