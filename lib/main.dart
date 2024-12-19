import 'package:clinic/core/util/constants.dart';
import 'package:clinic/features/doctors/data/datasources/remote_doctor_datasource.dart';
import 'package:clinic/features/doctors/data/repos/doctor_repo_impl.dart';
import 'package:clinic/features/doctors/domain/usecases/fetch_doctor_orders.dart';
import 'package:clinic/features/doctors/domain/usecases/fetch_doctors_usecase.dart';
import 'package:clinic/features/doctors/presentation/manager/docotr_cubit/doctors_cubit.dart';
import 'package:clinic/features/doctors/presentation/manager/docotr_order_cubit/doctor_order_cubit.dart';
import 'package:clinic/features/examinatios_prices/data/datasources/remote/remote_data_source.dart';
import 'package:clinic/features/examinatios_prices/data/repo/examination_repository_impl.dart';
import 'package:clinic/features/examinatios_prices/domain/usecases/fetch_examination_details_usecase.dart';
import 'package:clinic/features/examinatios_prices/domain/usecases/fetch_output_uscase.dart';
import 'package:clinic/features/examinatios_prices/domain/usecases/update_output_price_usecase.dart';
import 'package:clinic/features/examinatios_prices/domain/usecases/update_price_usecase.dart';
import 'package:clinic/features/examinatios_prices/presentation/manager/examination_cubit/examination_cubit.dart';
import 'package:clinic/features/examinatios_prices/presentation/manager/output_cubit/output_cubit.dart';
import 'package:clinic/features/home/data/datasources/remote_data_source.dart';
import 'package:clinic/features/home/data/repos/data_repo_impl.dart';
import 'package:clinic/features/home/domain/usecase/fetch_order_usecase.dart';
import 'package:clinic/features/home/presentation/manager/cubit/order_cubit.dart';
import 'package:clinic/features/home/presentation/widgets/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: SupabaseKeys.projectUrl,
    anonKey: SupabaseKeys.anonyKey,
  );

  runApp(CliniApp(
    fetchExaminationDetailsUseCase: FetchExaminationDetailsUseCase(
        ExaminationRepositoryImpl(
            ExaminationRemoteDataSource(supabase.client))),
    fetchOrdersUseCase: FetchOrdersUseCase(
      DataRepositoryImpl(
        RemoteDataSource(supabase.client),
      ),
    ),
    fetchAllDoctorsUseCase: FetchAllDoctorsUseCase(
      DoctorRepositoryImpl(
        DoctorRemoteDataSource(supabase.client),
      ),
    ),
    fetchDoctorOrdersUseCase: FetchDoctorOrdersUseCase(
      DoctorRepositoryImpl(
        DoctorRemoteDataSource(supabase.client),
      ),
    ),
    updatePriceUseCase: UpdatePriceUseCase(ExaminationRepositoryImpl(
        ExaminationRemoteDataSource(supabase.client))),
    fetchOutputDetailsUseCase: FetchOutputDetailsUseCase(
        ExaminationRepositoryImpl(
            ExaminationRemoteDataSource(supabase.client))),
    updateOutputPriceUseCase: UpdateOutputPriceUseCase(
        ExaminationRepositoryImpl(
            ExaminationRemoteDataSource(supabase.client))),
  ));
}

class CliniApp extends StatelessWidget {
  const CliniApp({
    super.key,
    required this.fetchOrdersUseCase,
    required this.fetchAllDoctorsUseCase,
    required this.fetchDoctorOrdersUseCase,
    required this.fetchExaminationDetailsUseCase,
    required this.updatePriceUseCase,
    required this.fetchOutputDetailsUseCase,
    required this.updateOutputPriceUseCase,
  });

  final FetchOrdersUseCase fetchOrdersUseCase;
  final FetchAllDoctorsUseCase fetchAllDoctorsUseCase;
  final FetchDoctorOrdersUseCase fetchDoctorOrdersUseCase;
  final FetchExaminationDetailsUseCase fetchExaminationDetailsUseCase;
  final UpdatePriceUseCase updatePriceUseCase;
  final FetchOutputDetailsUseCase fetchOutputDetailsUseCase;
  final UpdateOutputPriceUseCase updateOutputPriceUseCase;
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
            create: (context) =>
                DoctorsCubit(fetchAllDoctorsUseCase)..fetchDoctors(),
          ),
          BlocProvider(
            create: (context) => DoctorOrdersCubit(fetchDoctorOrdersUseCase),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: AppColor.primaryColor,
            fontFamily: AppFont.primaryFont,
            textTheme: TextTheme(
              bodyMedium: TextStyle(fontSize: 16.sp),
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
            Locale('en', ''),
            Locale('ar', ''),
          ],
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
