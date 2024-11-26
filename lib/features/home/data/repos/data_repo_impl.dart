import 'package:clinic/features/home/data/datasources/remote_data_source.dart';
import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/domain/repos/data_repo.dart';

class DataRepositoryImpl implements DataRepository {
  final RemoteDataSource remoteDataSource;

  DataRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Order>> fetchAllOrders(
      DateTime startDate, DateTime endDate) async {
    // Fetch all orders
    final orders = await remoteDataSource.fetchAllOrders(startDate, endDate);

    // Update doctor names for each order asynchronously
    for (var order in orders) {
      order.doctorName = await remoteDataSource.fetchDoctorName(order.doctorId);
    }

    return orders;
  }
}
