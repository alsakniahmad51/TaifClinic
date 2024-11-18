import 'package:clinic/features/doctors/domain/entities/doctor.dart';
import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DoctorRemoteDataSource {
  final SupabaseClient supabase;

  DoctorRemoteDataSource(this.supabase);

  Future<List<Doctor>> fetchAllDoctors() async {
    final response = await supabase
        .from('doctors')
        .select('doctor_id, user_id, doctor_name, phone_number');

    if (response == null) throw Exception('Failed to fetch doctors.');

    final List<dynamic> data = response as List<dynamic>;
    return data.map((item) => Doctor.fromJson(item)).toList();
  }

  Future<List<Order>> fetchDoctorOrders(int doctorId) async {
    final response = await supabase.from('orders').select('''
          order_id,
          doctor_id,
          patient_id,
          date,
          additional_notes,
          order_price,
          order_output,
          patients(
            patient_id,
            patient_name,
            age,
            phone_number
          ),
          
          examinationdetails!inner(
            detail_id,
            price,
            mode:examinationmodes(mode_id, mode_name),
            option:examinationoptions(option_id, option_name),
            type:examinationtypes(examination_type_id, type_name)
          )
        ''').eq('doctor_id', doctorId);
/**
 * final response = await supabase.from('orders').select('''
          order_id,
          doctor_id,
          patient_id,
          date,
          additional_notes,
          order_price,
          patients(patient_name, age, phone_number),
          examinationdetails(detail_id, price)
        ''').eq('doctor_id', doctorId)
 */
    if (response == null) throw Exception('Failed to fetch doctor orders.');

    final List<dynamic> data = response as List<dynamic>;
    return data.map((item) => Order.fromJson(item)).toList();
  }
}









// class DoctorRemoteDataSource {
//   final SupabaseClient supabase;

//   DoctorRemoteDataSource(this.supabase);

//   Future<List<Doctor>> fetchAllDoctors() async {
//     final response = await supabase
//         .from('doctors')
//         .select('doctor_id, user_id, doctor_name, phone_number');

//     if (response == null) throw Exception('Failed to fetch doctors.');

//     final List<dynamic> data = response as List<dynamic>;
//     return data.map((item) => Doctor(
//       id: item['doctor_id'],
//       userId: item['user_id'],
//       name: item['doctor_name'],
//       phoneNumber: item['phone_number'],
//     )).toList();
//   }

//   Future<List<Order>> fetchDoctorOrders(int doctorId) async {
//     final response = await supabase
//         .from('orders')
//         .select('''
//           order_id,
//           doctor_id,
//           patient_id,
//           date,
//           additional_notes,
//           order_price,
//           patients(patient_name, age, phone_number),
//           examinationdetails(detail_id, price)
//         ''')
//         .eq('doctor_id', doctorId);

//     if (response == null) throw Exception('Failed to fetch doctor orders.');

//     final List<dynamic> data = response as List<dynamic>;
//     return data.map((item) => Order.fromJson(item)).toList();
//   }
// }
