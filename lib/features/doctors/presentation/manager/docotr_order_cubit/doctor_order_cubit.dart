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

  Future<void> fetchOrders(int doctorId) async {
    emit(DoctorOrdersLoading());
    try {
      final orders = await getDoctorOrdersUseCase(doctorId);
      allOrders = orders;
      filteredOrders = orders; // في البداية يتم عرض كل الطلبات
      emit(DoctorOrdersLoaded(filteredOrders));
    } catch (e) {
      emit(DoctorOrdersError('Failed to fetch orders: $e'));
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
