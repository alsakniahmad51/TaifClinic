import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/domain/repos/data_repo.dart';

class FetchOrdersUseCase {
  final DataRepository repository;

  FetchOrdersUseCase(this.repository);

  Future<List<Order>> call(DateTime startDate, DateTime endDate) async {
    return await repository.fetchAllOrders(startDate, endDate);
  }
}
