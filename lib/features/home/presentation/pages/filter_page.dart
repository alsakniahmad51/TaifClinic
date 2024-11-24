import 'package:clinic/features/doctors/presentation/manager/docotr_cubit/doctors_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<String> selectedDoctors = [];
  String? selectedImageType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('فلترة البيانات'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // قائمة الأطباء
            const Text(
              'اختيار الأطباء',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            BlocBuilder<DoctorsCubit, DoctorsState>(
              builder: (context, state) {
                if (state is DoctorsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is DoctorsLoaded) {
                  return DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    hint: const Text('اختر طبيباً'),
                    items: state.doctors.map((doctor) {
                      return DropdownMenuItem<String>(
                        value: doctor.name,
                        child: Text(doctor.name),
                      );
                    }).toList(),
                    onChanged: (doctorName) {
                      setState(() {
                        if (doctorName != null &&
                            !selectedDoctors.contains(doctorName)) {
                          selectedDoctors.add(doctorName);
                        }
                      });
                    },
                  );
                } else {
                  return const Text('حدث خطأ بتحميل الأطباء');
                }
              },
            ),
            SizedBox(height: 16.h),
            // قائمة نوع الصورة
            const Text(
              'اختيار نوع الصورة',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              hint: const Text('اختر نوع الصورة'),
              items: [
                'سيفالوماتريك',
                'C.B.C.T',
                'بانوراما',
              ].map((type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedImageType = value;
                });
              },
            ),
            SizedBox(height: 16.h),
            // زر تطبيق الفلترة
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 48.h),
              ),
              onPressed: () {
                Navigator.pop(context, {
                  'selectedDoctors': selectedDoctors,
                  'selectedImageType': selectedImageType,
                });
              },
              child: const Text('تطبيق الفلترة'),
            ),
          ],
        ),
      ),
    );
  }
}
