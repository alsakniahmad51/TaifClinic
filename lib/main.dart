import 'package:clinic/core/util/constants.dart';
import 'package:clinic/features/home/data/datasources/remote_data_source.dart';
import 'package:clinic/features/home/data/repos/data_repo_impl.dart';
import 'package:clinic/features/home/domain/usecase/fetch_order_usecase.dart';
import 'package:clinic/features/home/presentation/manager/cubit/order_cubit.dart';
import 'package:clinic/features/welcome/presentation/pages/splash.dart';
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
        (DataRepositoryImpl(RemoteDataSource(supabase.client)))),
  ));
}

class CliniApp extends StatelessWidget {
  const CliniApp({super.key, required this.fetchOrdersUseCase});
  final FetchOrdersUseCase fetchOrdersUseCase;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) => BlocProvider<OrderCubit>(
        create: (context) => OrderCubit(fetchOrdersUseCase)..fetchOrders(),
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
