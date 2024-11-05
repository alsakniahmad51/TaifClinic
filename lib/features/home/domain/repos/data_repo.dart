import 'package:clinic/features/home/domain/Entities/doctor.dart';
import 'package:clinic/features/home/domain/Entities/examination.dart';
import 'package:clinic/features/home/domain/Entities/note.dart';
import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/domain/Entities/patient.dart';

abstract class DataRepository {
  Future<List<Doctor>> fetchAllDoctors();
  Future<List<Patient>> fetchAllPatients();
  Future<List<Order>> fetchAllOrders();
  Future<List<Examination>> fetchAllExaminations();
  Future<List<Note>> fetchAllNotes();
}