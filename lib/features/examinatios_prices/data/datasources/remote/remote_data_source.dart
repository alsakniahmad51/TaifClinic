import 'dart:developer';

import 'package:clinic/features/home/domain/Entities/examination_detail.dart';
import 'package:clinic/features/home/domain/Entities/output.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExaminationRemoteDataSource {
  final SupabaseClient supabase;

  ExaminationRemoteDataSource(this.supabase);

  Future<List<ExaminationDetail>> fetchExaminationDetails() async {
    try {
      final response = await supabase.from('examinationdetails').select('''
            detail_id,
            price,
            mode:examinationmodes(mode_id, mode_name),
            option:examinationoptions(option_id, option_name),
            type:examinationtypes(examination_type_id, type_name)
          ''');

      final data = response as List<dynamic>;
      return data.map((json) => ExaminationDetail.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch examination details: ${e.toString()}');
    }
  }

  Future<void> updateExaminationPrice(int detailId, int newPrice) async {
    try {
      await supabase
          .from('examinationdetails')
          .update({'price': newPrice}).eq('detail_id', detailId);
    } catch (e) {
      throw Exception('Failed to update price: ${e.toString()}');
    }
  }

  Future<List<Output>> fetchOutputDetails() async {
    try {
      final response =
          await supabase.from('output').select('id, output_type, price');
      final data = response as List<dynamic>;
      return data.map((json) => Output.fromjson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch output details: ${e.toString()}');
    }
  }

  Future<void> updateOutputPrice(int id, int newPrice) async {
    try {
      await supabase.from('output').update({'price': newPrice}).eq('id', id);
    } catch (e) {
      throw Exception('Failed to update price: ${e.toString()}');
    }
  }
}
