class Order {
  final int id;
  final int doctorId;
  final int patientId;
  final String patientName;
  final String doctorName; // حقل جديد لاسم الطبيب
  final DateTime date;
  final int patientAge;
  final String type;
  final String? examinationOptions;
  final String? outputType;
  final String? additionalNotes;

  Order({
    required this.id,
    required this.doctorId,
    required this.patientId,
    required this.patientName,
    required this.doctorName, // تضمين الحقل الجديد
    required this.date,
    required this.patientAge,
    required this.type,
    this.examinationOptions,
    this.outputType,
    this.additionalNotes,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['order_id'],
      doctorId: json['doctor_id'],
      patientId: json['patient_id'],
      patientName: json['patients']['patient_name'] ?? 'غير معروف',
      doctorName:
          json['doctors']['doctor_name'] ?? 'غير معروف', // إضافة اسم الطبيب
      date: DateTime.parse(json['date']),
      patientAge: json['patient_age'],
      type: json['type'],
      examinationOptions: json['examination_options'],
      outputType: json['output_type'],
      additionalNotes: json['additional_notes'],
    );
  }
}
