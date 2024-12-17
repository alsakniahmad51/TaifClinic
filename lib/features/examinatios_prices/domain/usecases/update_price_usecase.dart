import 'package:clinic/features/examinatios_prices/domain/repo/examination_repository.dart';

class UpdatePriceUseCase {
  final ExaminationRepository repository;

  UpdatePriceUseCase(this.repository);

  Future<void> call(int detailId, int newPrice) async {
    await repository.updateExaminationPrice(detailId, newPrice);
  }
}
