import 'dart:developer';

import 'package:clinic/features/home/domain/Entities/doctor.dart';
import 'package:clinic/features/home/domain/Entities/examination.dart';
import 'package:clinic/features/home/domain/Entities/note.dart';
import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/domain/Entities/patient.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteDataSource {
  final SupabaseClient supabase;

  RemoteDataSource(this.supabase);

  Future<List<Doctor>> fetchAllDoctors() async {
    final response = await supabase
        .from('doctors')
        .select(); // استخدم execute() للحصول على بيانات Supabase

    // Cast the data to a List of dynamic
    final List<dynamic> data = response as List<dynamic>;

    // Convert the data to List<Doctor>
    return data.map((item) => Doctor.fromJson(item)).toList();
  }

  Future<List<Patient>> fetchAllPatients() async {
    try {
      final response = await supabase.from('patients').select();
      final List<dynamic> data = response;
      return data.map((item) => Patient.fromJson(item)).toList();
    } catch (e) {
      throw Exception('Failed to load patients: ${e.toString()}');
    }
    // استخدم execute() للحصول على بيانات Supabase

    // Handle the response to check for errors

    // Cast the data to a List of dynamic

    // Convert the data to List<Patient>
  }

  Future<List<Note>> fetchAllNotes() async {
    try {
      final response = await supabase.from('notes').select();

      // تأكد من أن البيانات ليست null واحتوائها على قائمة
      final List<dynamic> data = response as List<dynamic>;

      // تحويل البيانات إلى List<Note>
      return data.map((item) => Note.fromJson(item)).toList();
    } catch (e) {
      throw Exception('Failed to load notes: ${e.toString()}');
    }
  }

  Future<List<Order>> fetchAllOrders() async {
    try {
      final response = await supabase
          .from('orders')
          .select('*, patients(patient_name), doctors(doctor_name)');
      log(response.toString());

      final List<dynamic> data = response as List<dynamic>;

      return data.map((item) => Order.fromJson(item)).toList();
    } catch (e) {
      throw Exception('Failed to load orders: ${e.toString()}');
    }
  }

  Future<List<Examination>> fetchAllExaminations() async {
    try {
      final response = await supabase.from('examinations').select();

      // تأكد من أن البيانات ليست null واحتوائها على قائمة
      final List<dynamic> data = response as List<dynamic>;

      // تحويل البيانات إلى List<Examination>
      return data.map((item) => Examination.fromJson(item)).toList();
    } catch (e) {
      throw Exception('Failed to load examinations: ${e.toString()}');
    }
  }
}
