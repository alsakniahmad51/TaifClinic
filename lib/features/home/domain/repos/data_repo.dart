import 'package:clinic/features/home/domain/Entities/order.dart';

abstract class DataRepository {
  Future<List<Order>> fetchAllOrders();
}
