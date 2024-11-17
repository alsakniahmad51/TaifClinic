import 'package:bloc/bloc.dart';
import 'package:clinic/features/doctors/domain/entities/doctor.dart';
import 'package:clinic/features/doctors/domain/repos/doctor_repo.dart';
import 'package:clinic/features/doctors/domain/usecases/fetch_doctors_usecase.dart';
import 'package:equatable/equatable.dart';

part 'doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  final FetchAllDoctorsUseCase getAllDoctorsUseCase;

  DoctorsCubit(this.getAllDoctorsUseCase) : super(DoctorsInitial());

  Future<void> fetchDoctors() async {
    emit(DoctorsLoading());
    try {
      final doctors = await getAllDoctorsUseCase();
      emit(DoctorsLoaded(doctors));
    } catch (e) {
      emit(DoctorsError('Failed to fetch doctors: $e'));
    }
  }
}
