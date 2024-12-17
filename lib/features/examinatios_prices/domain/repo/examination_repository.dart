import 'package:clinic/features/home/domain/Entities/examination_detail.dart';

abstract class ExaminationRepository {
  Future<List<ExaminationDetail>> fetchExaminationDetails();
  Future<void> updateExaminationPrice(int detailId, int newPrice);
}
