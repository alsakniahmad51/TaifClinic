import 'package:clinic/clinic_app.dart';
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
import 'package:clinic/features/home/presentation/manager/fetch_order_cubit/order_cubit.dart';
import 'package:clinic/features/home/presentation/manager/update_price_order_cubit/update_order_cubit.dart';
import 'package:clinic/features/splash/data/data_sources/remote/get_version_remote.dart';
import 'package:clinic/features/splash/data/repo/get_version_repo_impl.dart';
import 'package:clinic/features/splash/domain/usecase/get_remote_version_usecase.dart';
import 'package:clinic/features/splash/presentation/manager/cubit/get_remote_version_cubit.dart';
import 'package:clinic/features/splash/presentation/pages/splash_page.dart';
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

  var cliniApp = ClinicApp(
    fetchExaminationDetailsUseCase: FetchExaminationDetailsUseCase(
      ExaminationRepositoryImpl(
        ExaminationRemoteDataSource(supabase.client),
      ),
    ),
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
    updatePriceUseCase: UpdatePriceUseCase(
      ExaminationRepositoryImpl(
        ExaminationRemoteDataSource(supabase.client),
      ),
    ),
    fetchOutputDetailsUseCase: FetchOutputDetailsUseCase(
      ExaminationRepositoryImpl(
        ExaminationRemoteDataSource(supabase.client),
      ),
    ),
    updateOutputPriceUseCase: UpdateOutputPriceUseCase(
      ExaminationRepositoryImpl(
        ExaminationRemoteDataSource(supabase.client),
      ),
    ),
    getRemoteVersionUsecase: GetRemoteVersionUsecase(
      getVersionRepoImpl: GetVersionRepoImpl(
        getRemoteVersionC: GetRemoteVersion(supabaseClient: supabase.client),
      ),
    ),
  );
  runApp(cliniApp);
}
