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
      id: json['order_id'],
      doctorId: json['doctor_id'],
      patientId: json['patient_id'],
      patientName: json['patients'] != null
          ? json['patients']['patient_name'] ?? 'غير معروف'
          : 'غير معروف',
      doctorName: json['doctors'] != null
          ? json['doctors']['doctor_name'] ?? 'غير معروف'
          : 'غير معروف',
      date: DateTime.parse(json['date']),
      patientAge: json['patient_age'],
      detail: ExaminationDetail.fromJson(json['examinationdetails']),
      additionalNotes: json['additional_notes'],
    );
  }
}
