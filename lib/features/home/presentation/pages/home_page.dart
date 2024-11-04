import 'package:clinic/features/home/presentation/widgets/home_page_body.dart';
import 'package:clinic/features/home/presentation/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

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
