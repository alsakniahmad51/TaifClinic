import 'package:clinic/features/home/domain/Entities/examination_detail.dart';

class Order {
  final int id;
  final int doctorId;
  final int patientId;
  String patientName;
  String doctorName;
  final DateTime date;
  final int patientAge;
  final ExaminationDetail? detail;
  final String? additionalNotes;

  Order({
    required this.detail,
    required this.id,
    required this.doctorId,
    required this.patientId,
    this.patientName = 'غير معروف',
    this.doctorName = 'غير معروف',
    required this.date,
    required this.patientAge,
    this.additionalNotes,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['order_id'] ?? 0,
      doctorId: json['doctor_id'] ?? 0,
      patientId: json['patient_id'] ?? 0,
      patientName: json['patients']?['patient_name'] ?? 'غير معروف',
      doctorName: json['doctors']?['doctor_name'] ?? 'غير معروف',
      date:
          json['date'] != null ? DateTime.parse(json['date']) : DateTime.now(),
      patientAge: json['patient_age'] ?? 0,
      detail: json['examinationdetails'] != null
          ? ExaminationDetail.fromJson(json['examinationdetails'])
          : null,
      additionalNotes: json['additional_notes'] ?? 'لا يوجد',
    );
  }
}
