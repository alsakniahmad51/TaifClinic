import 'dart:async';

import 'package:clinic/core/util/constants.dart';
import 'package:clinic/features/home/presentation/pages/page_view.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () async {
      await Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const Pageview(),
      ));
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          fit: BoxFit.fitWidth,
          logo,
        ),
      ),
    );
  }
}
