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
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _formatText('نوع الصورة : ${detail.type.typeName}'),
                        style: style(),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      if (detail.mode.modeName != "لا يوجد")
                        Text(
                          _formatText('وضعية الصورة : ${detail.mode.modeName}'),
                          style: style(),
                        ),
                      SizedBox(
                        height: 3.h,
                      ),
                      if (detail.option.optionName != "لا يوجد")
                        Text(
                          _formatText(
                              'الجزء المراد تصويره: ${detail.option.optionName}'),
                          style: style(),
                        ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        'السعر : ${detail.price}',
                        style: style().copyWith(color: AppColor.primaryColor),
                      ),
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

  String _formatText(String text) {
    int spaceCount = text.split(' ').length - 1;
    if (spaceCount > 4) {
      List<String> words = text.split(' ');
      int middleIndex = (words.length / 2).ceil();
      return '${words.sublist(0, middleIndex).join(' ')}\n${words.sublist(middleIndex).join(' ')}';
    }
    return text;
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
                'تعديل السعر',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                enableColor: AppColor.primaryColor,
                focuseColor: AppColor.primaryColor,
                title: 'أدخل السعر الجديد',
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
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final newPrice = int.tryParse(priceController.text);

                    if (newPrice != null) {
                      context
                          .read<ExaminationCubit>()
                          .updateExaminationPrice(detail.detailId, newPrice);

                      context
                          .read<ExaminationCubit>()
                          .fetchExaminationDetails();
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
