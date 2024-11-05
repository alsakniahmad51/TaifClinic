import 'package:bloc/bloc.dart';
import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/domain/usecase/fetch_order_usecase.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final FetchOrdersUseCase fetchOrdersUseCase;

  OrderCubit(this.fetchOrdersUseCase) : super(OrderInitial());

  Future<void> fetchOrders() async {
    emit(OrderLoading());
    try {
      final orders = await fetchOrdersUseCase();
      emit(OrderLoaded(orders));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }
}