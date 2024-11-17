import 'package:clinic/features/doctors/domain/repos/doctor_repo.dart';
import 'package:clinic/features/home/domain/Entities/order.dart';

class FetchDoctorOrdersUseCase {
  final DoctorRepository repository;

  FetchDoctorOrdersUseCase(this.repository);

  Future<List<Order>> call(int doctorId) async {
    return await repository.getDoctorOrders(doctorId);
  }
}
