import 'package:clinic/features/welcome/presentation/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://ncbjffnfecycqtlwwgco.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5jYmpmZm5mZWN5Y3F0bHd3Z2NvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjk1MzIyODIsImV4cCI6MjA0NTEwODI4Mn0.-dCoPEwNB8ov6Lpyg_RMkre27ejO7SjXnJdxgr02F6I',
  );
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
