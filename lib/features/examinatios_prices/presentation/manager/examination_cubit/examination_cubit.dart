import 'package:bloc/bloc.dart';
import 'package:clinic/features/examinatios_prices/domain/usecases/fetch_examination_details_usecase.dart';
import 'package:clinic/features/examinatios_prices/domain/usecases/update_price_usecase.dart';
import 'package:clinic/features/home/domain/Entities/examination_detail.dart';
import 'package:equatable/equatable.dart';

part 'examination_state.dart';

class ExaminationCubit extends Cubit<ExaminationState> {
  final FetchExaminationDetailsUseCase fetchDetailsUseCase;
  final UpdatePriceUseCase updatePriceUseCase;

  ExaminationCubit({
    required this.fetchDetailsUseCase,
    required this.updatePriceUseCase,
  }) : super(ExaminationInitial());

  Future<void> fetchExaminationDetails() async {
    emit(ExaminationLoading());
    try {
      final details = await fetchDetailsUseCase();
      emit(ExaminationLoaded(details: details));
    } catch (error) {
      emit(ExaminationError(message: error.toString()));
    }
  }

  Future<void> updateExaminationPrice(int detailId, int newPrice) async {
    emit(ExaminationUpdatingPrice());
    try {
      await updatePriceUseCase(detailId, newPrice);
      await fetchExaminationDetails();
    } catch (error) {
      emit(ExaminationError(message: error.toString()));
    }
  }
}
