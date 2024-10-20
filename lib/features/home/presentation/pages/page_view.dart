import 'package:clinic/features/home/presentation/widgets/page_view_body.dart';
import 'package:flutter/material.dart';

class Pageview extends StatelessWidget {
  const Pageview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: const Color(0xffEBEBEB),
      body: PageViewBody(),
    );
  }
}
