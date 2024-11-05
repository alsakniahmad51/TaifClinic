import 'package:clinic/features/home/data/datasources/remote_data_source.dart';
import 'package:clinic/features/home/domain/Entities/doctor.dart';
import 'package:clinic/features/home/domain/Entities/examination.dart';
import 'package:clinic/features/home/domain/Entities/note.dart';
import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/domain/Entities/patient.dart';
import 'package:clinic/features/home/domain/repos/data_repo.dart';

class DataRepositoryImpl implements DataRepository {
  final RemoteDataSource remoteDataSource;

  DataRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Doctor>> fetchAllDoctors() async {
    return await remoteDataSource.fetchAllDoctors();
  }

  @override
  Future<List<Examination>> fetchAllExaminations() async {
    return await remoteDataSource
        .fetchAllExaminations(); // تأكد من أن لديك دالة fetchAllExaminations في RemoteDataSource
  }

  @override
  Future<List<Note>> fetchAllNotes() async {
    return await remoteDataSource
        .fetchAllNotes(); // تأكد من أن لديك دالة fetchAllNotes في RemoteDataSource
  }

  @override
  Future<List<Order>> fetchAllOrders() async {
    return await remoteDataSource
        .fetchAllOrders(); // تأكد من أن لديك دالة fetchAllOrders في RemoteDataSource
  }

  @override
  Future<List<Patient>> fetchAllPatients() async {
    return await remoteDataSource.fetchAllPatients();
  }
}
