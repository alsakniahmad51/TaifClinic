import 'package:bloc/bloc.dart';
import 'package:clinic/features/doctors/domain/usecases/fetch_doctor_orders.dart';
import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:equatable/equatable.dart';

part 'doctor_order_state.dart';

class DoctorOrdersCubit extends Cubit<DoctorOrdersState> {
  final FetchDoctorOrdersUseCase getDoctorOrdersUseCase;

  List<Order> allOrders = []; // القائمة الأصلية
  List<Order> filteredOrders = []; // القائمة المفلترة

  DoctorOrdersCubit(this.getDoctorOrdersUseCase) : super(DoctorOrdersInitial());

  Future<void> fetchOrders(int doctorId, int? month, int? year) async {
    emit(DoctorOrdersLoading());
    try {
      final orders = await getDoctorOrdersUseCase.call(
        doctorId,
        month,
        year,
      );
      emit(DoctorOrdersLoaded(orders));
    } catch (error) {
      emit(DoctorOrdersError(error.toString()));
    }
  }

  void searchOrders(String query) {
    filteredOrders = allOrders
        .where((order) => order.patientName
            .toLowerCase()
            .contains(query.toLowerCase())) // البحث حسب اسم المريض
        .toList();
    emit(DoctorOrdersLoaded(filteredOrders));
  }
}
