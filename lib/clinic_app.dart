import 'package:clinic/core/util/constants.dart';
import 'package:clinic/features/doctors/domain/usecases/fetch_doctor_orders.dart';
import 'package:clinic/features/doctors/domain/usecases/fetch_doctors_usecase.dart';
import 'package:clinic/features/doctors/presentation/manager/docotr_cubit/doctors_cubit.dart';
import 'package:clinic/features/doctors/presentation/manager/docotr_order_cubit/doctor_order_cubit.dart';
import 'package:clinic/features/examinatios_prices/domain/usecases/fetch_examination_details_usecase.dart';
import 'package:clinic/features/examinatios_prices/domain/usecases/fetch_output_uscase.dart';
import 'package:clinic/features/examinatios_prices/domain/usecases/update_output_price_usecase.dart';
import 'package:clinic/features/examinatios_prices/domain/usecases/update_price_usecase.dart';
import 'package:clinic/features/examinatios_prices/presentation/manager/examination_cubit/examination_cubit.dart';
import 'package:clinic/features/examinatios_prices/presentation/manager/output_cubit/output_cubit.dart';
import 'package:clinic/features/home/domain/usecase/fetch_order_usecase.dart';
import 'package:clinic/features/home/presentation/manager/fetch_order_cubit/order_cubit.dart';
import 'package:clinic/features/home/presentation/manager/update_price_order_cubit/update_order_cubit.dart';
import 'package:clinic/features/splash/domain/usecase/get_remote_version_usecase.dart';
import 'package:clinic/features/splash/presentation/manager/cubit/get_remote_version_cubit.dart';
import 'package:clinic/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:month_year_picker/month_year_picker.dart';

class ClinicApp extends StatelessWidget {
  const ClinicApp({
    super.key,
    required this.fetchOrdersUseCase,
    required this.fetchAllDoctorsUseCase,
    required this.fetchDoctorOrdersUseCase,
    required this.fetchExaminationDetailsUseCase,
    required this.updatePriceUseCase,
    required this.fetchOutputDetailsUseCase,
    required this.updateOutputPriceUseCase,
    required this.getRemoteVersionUsecase,
  });

  final FetchOrdersUseCase fetchOrdersUseCase;
  final FetchAllDoctorsUseCase fetchAllDoctorsUseCase;
  final FetchDoctorOrdersUseCase fetchDoctorOrdersUseCase;
  final FetchExaminationDetailsUseCase fetchExaminationDetailsUseCase;
  final UpdatePriceUseCase updatePriceUseCase;
  final FetchOutputDetailsUseCase fetchOutputDetailsUseCase;
  final UpdateOutputPriceUseCase updateOutputPriceUseCase;
  final GetRemoteVersionUsecase getRemoteVersionUsecase;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context)
              .size
              .height), // إعداد مقاسات التصميم الافتراضية
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<OutputCubit>(
            create: (context) => OutputCubit(
                fetchOutputUseCase: fetchOutputDetailsUseCase,
                updateOutputPriceUseCase: updateOutputPriceUseCase),
          ),
          BlocProvider<UpdatePriceOrderCubit>(
            create: (context) => UpdatePriceOrderCubit(fetchOrdersUseCase),
          ),
          BlocProvider<ExaminationCubit>(
              create: (context) => ExaminationCubit(
                    fetchDetailsUseCase: fetchExaminationDetailsUseCase,
                    updatePriceUseCase: updatePriceUseCase,
                  )),
          BlocProvider<OrderCubit>(
            create: (context) {
              final now = DateTime.now();
              final startOfMonth = DateTime(now.year, now.month, 1);
              final endOfMonth = DateTime(now.year, now.month + 1, 0);
              return OrderCubit(fetchOrdersUseCase)
                ..fetchOrders(startOfMonth, endOfMonth);
            },
          ),
          BlocProvider(
            create: (context) => GetRemoteVersionCubit(getRemoteVersionUsecase),
          ),
          BlocProvider(
            create: (context) =>
                DoctorsCubit(fetchAllDoctorsUseCase)..fetchDoctors(),
          ),
          BlocProvider(
            create: (context) => DoctorOrdersCubit(fetchDoctorOrdersUseCase),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme(
              brightness:
                  Brightness.light, // السطوع (أو Brightness.dark للوضع الداكن)
              primary: AppColor.primaryColor, // اللون الأساسي
              onPrimary: Colors.white, // لون النص فوق اللون الأساسي
              secondary: Colors.greenAccent, // اللون الثانوي
              onSecondary: Colors.black, // لون النص فوق اللون الثانوي
              error: Colors.red, // لون الخطأ
              onError: Colors.white, // لون النص فوق الخلفية
              surface: Colors.grey.shade100, // لون الأسطح مثل بطاقات العرض
              onSurface: Colors.black, // لون النص فوق الأسطح
            ),
            fontFamily: AppFont.primaryFont,
            textTheme: const TextTheme(
              bodyMedium: TextStyle(fontSize: 16.0),
            ),
          ),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            MonthYearPickerLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'english'),
            Locale('ar', 'Arabic'),
          ],
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
