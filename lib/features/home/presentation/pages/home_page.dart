import 'package:clinic/core/util/text_style.dart';
import 'package:clinic/features/home/presentation/widgets/home_page_body.dart';
import 'package:clinic/features/home/presentation/widgets/home_text_field.dart';
import 'package:clinic/features/home/presentation/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [HomeAppBar()],
      ),
      body: const HomePageBody(),
    );
  }
}
