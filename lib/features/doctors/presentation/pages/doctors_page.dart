import 'package:clinic/features/doctors/presentation/widgets/doctors_page_body.dart';
import 'package:clinic/features/home/presentation/widgets/home_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DoctorsPageBody(),
    );
  }
}
