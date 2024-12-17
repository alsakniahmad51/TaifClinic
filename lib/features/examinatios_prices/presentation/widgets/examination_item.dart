import 'package:clinic/core/util/constants.dart';
import 'package:clinic/core/util/widgets/custom_text_field.dart';
import 'package:clinic/features/examinatios_prices/presentation/manager/examination_cubit/examination_cubit.dart';
import 'package:clinic/features/home/domain/Entities/examination_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExaminationItem extends StatelessWidget {
  const ExaminationItem({
    super.key,
    required this.detail,
  });

  final ExaminationDetail detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            // color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 4,

                offset: const Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'نوع الصورة : ${detail.type.typeName}',
                        style: style(),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text('وضعية الصورة :${detail.mode.modeName}',
                          style: style()),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text('الجزء المراد تصويره: ${detail.option.optionName}',
                          style: style()),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text('السعر : ${detail.price}',
                          style:
                              style().copyWith(color: AppColor.primaryColor)),
                      SizedBox(
                        height: 3.h,
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      _showEditPriceSheet(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle style() => TextStyle(fontSize: 18.sp);

  /// BottomSheet لإدخال السعر الجديد
  void _showEditPriceSheet(BuildContext context) {
    final TextEditingController priceController =
        TextEditingController(); // يتحكم بحقل النص
    final _formKey = GlobalKey<FormState>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // لضمان ملء الشاشة عند ظهور لوحة المفاتيح
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          top: 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'تعديل السعر',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                enableColor: AppColor.primaryColor,
                focuseColor: AppColor.primaryColor,
                title: 'أدخل السعر الجديد',
                radius: 8.0,
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newPrice = int.tryParse(priceController.text);

                    if (newPrice != null) {
                      // استدعاء cubit لتحديث السعر
                      context
                          .read<ExaminationCubit>()
                          .updateExaminationPrice(detail.detailId, newPrice);
                      // إعادة جلب التفاصيل بعد التحديث
                      context
                          .read<ExaminationCubit>()
                          .fetchExaminationDetails();
                      Navigator.of(context).pop(); // إغلاق الـ BottomSheet
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
