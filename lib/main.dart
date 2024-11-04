import 'package:clinic/core/util/constants.dart';
import 'package:clinic/features/Auth/signUp/presentation/manager/cubit/auth_cubit.dart';
import 'package:clinic/features/welcome/presentation/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: SupabaseKeys.projectUrl,
    anonKey: SupabaseKeys.anonyKey,
  );
  runApp(const CliniApp());
}

class CliniApp extends StatelessWidget {
  const CliniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) => MaterialApp(
        theme: ThemeData(
          fontFamily: AppFont.primaryFont,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 16.0),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: SplashScreen(),
          ),
        ),
      ),
    );
  }
}
