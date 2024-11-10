import 'dart:developer';

import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteDataSource {
  final SupabaseClient supabase;

  RemoteDataSource(this.supabase);

  Future<List<Order>> fetchAllOrders() async {
    try {
      final response = await supabase.from('orders').select('''
        order_id,
        doctor_id,
        patient_id,
        date,
        patient_age,
        additional_notes,
      
        examinationdetails(
          detail_id,
          examinationmodes(mode_id, mode_name),
          examinationoptions(option_id, option_name),
          examinationtypes(examination_type_id, type_name)
        )
      ''');

      if (response == null) {
        throw Exception('No data returned');
      }

      final List<dynamic> data = response as List<dynamic>;
      final orders = data.map((item) => Order.fromJson(item)).toList();

      log(orders.toString());
      return orders;
    } catch (e) {
      throw Exception('Failed to load orders: ${e.toString()}');
    }
  }

  Future<String> fetchPatientName(int patientId) async {
    try {
      final response = await supabase
          .from('patients')
          .select('patient_name')
          .eq('patient_id', patientId)
          .maybeSingle();

      if (response == null) {
        return 'غير معروف';
      }

      return response['patient_name'] ?? 'غير معروف';
    } catch (e) {
      throw Exception('Failed to load patient name: ${e.toString()}');
    }
  }

  Future<String> fetchDoctorName(int doctorId) async {
    try {
      final response = await supabase
          .from('doctors')
          .select('doctor_name')
          .eq('doctor_id', doctorId)
          .maybeSingle();

      if (response == null) {
        return 'غير معروف';
      }

      return response['doctor_name'] ?? 'غير معروف';
    } catch (e) {
      throw Exception('Failed to load doctor name: ${e.toString()}');
    }
  }
}
