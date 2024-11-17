import 'package:bloc/bloc.dart';
import 'package:clinic/features/doctors/domain/usecases/fetch_doctor_orders.dart';
import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:equatable/equatable.dart';

part 'doctor_order_state.dart';

class DoctorOrdersCubit extends Cubit<DoctorOrdersState> {
  final FetchDoctorOrdersUseCase getDoctorOrdersUseCase;

  DoctorOrdersCubit(this.getDoctorOrdersUseCase) : super(DoctorOrdersInitial());

  Future<void> fetchOrders(int doctorId) async {
    emit(DoctorOrdersLoading());
    try {
      final orders = await getDoctorOrdersUseCase(doctorId);
      emit(DoctorOrdersLoaded(orders));
    } catch (e) {
      emit(DoctorOrdersError('Failed to fetch orders: $e'));
    }
  }
}
