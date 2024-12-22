import 'package:clinic/core/util/constants.dart';
import 'package:flutter/material.dart';

class SplashScreenViewBody extends StatelessWidget {
  const SplashScreenViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          logo,
          height: 500,
          width: 500,
        ),
      ),
    );
  }
}
