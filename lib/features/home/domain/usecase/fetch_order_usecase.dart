import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/domain/repos/data_repo.dart';

class FetchOrdersUseCase {
  final DataRepository repository;

  FetchOrdersUseCase(this.repository);

  Future<List<Order>> call(DateTime startDate, DateTime endDate) async {
    final orders = await repository.fetchAllOrders(startDate, endDate);

    // جلب أسماء الأطباء دفعة واحدة لتحسين الأداء
    final doctorIds = orders.map((o) => o.doctorId).toSet();
    final doctorNames = await repository.fetchDoctorNames(doctorIds);

    // تحديث أسماء الأطباء في الطلبات
    for (var order in orders) {
      order.doctorName = doctorNames[order.doctorId] ?? 'غير معروف';
    }

    return orders;
  }
}
