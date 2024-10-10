import 'package:clinic/features/welcome/presentation/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const CliniApp());
}

class CliniApp extends StatelessWidget {
  const CliniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: SplashScreen(),
          ),
        ),
      ),
    );
  }
}
