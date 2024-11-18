import 'package:clinic/core/util/constants.dart';
import 'package:clinic/features/doctors/data/datasources/remote_doctor_datasource.dart';
import 'package:clinic/features/doctors/data/repos/doctor_repo_impl.dart';
import 'package:clinic/features/doctors/domain/usecases/fetch_doctor_orders.dart';
import 'package:clinic/features/doctors/domain/usecases/fetch_doctors_usecase.dart';
import 'package:clinic/features/doctors/presentation/manager/docotr_cubit/doctors_cubit.dart';
import 'package:clinic/features/doctors/presentation/manager/docotr_order_cubit/doctor_order_cubit.dart';
import 'package:clinic/features/home/data/datasources/remote_data_source.dart';
import 'package:clinic/features/home/data/repos/data_repo_impl.dart';
import 'package:clinic/features/home/domain/usecase/fetch_order_usecase.dart';
import 'package:clinic/features/home/presentation/manager/cubit/order_cubit.dart';
import 'package:clinic/features/home/presentation/widgets/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  final supabase = await Supabase.initialize(
    url: SupabaseKeys.projectUrl,
    anonKey: SupabaseKeys.anonyKey,
  );
  runApp(CliniApp(
    fetchOrdersUseCase: FetchOrdersUseCase(
      (DataRepositoryImpl(
        RemoteDataSource(supabase.client),
      )),
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
  ));
}

class CliniApp extends StatelessWidget {
  const CliniApp(
      {super.key,
      required this.fetchOrdersUseCase,
      required this.fetchAllDoctorsUseCase,
      required this.fetchDoctorOrdersUseCase});
  final FetchOrdersUseCase fetchOrdersUseCase;
  final FetchAllDoctorsUseCase fetchAllDoctorsUseCase;
  final FetchDoctorOrdersUseCase fetchDoctorOrdersUseCase;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<OrderCubit>(
            create: (context) => OrderCubit(fetchOrdersUseCase)..fetchOrders(),
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
            fontFamily: AppFont.primaryFont,
            textTheme: TextTheme(
              bodyMedium: TextStyle(fontSize: 16.sp),
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
      ),
    );
  }
}
