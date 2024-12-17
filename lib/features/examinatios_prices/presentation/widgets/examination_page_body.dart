import 'package:clinic/core/util/constants.dart';
import 'package:clinic/features/examinatios_prices/presentation/manager/examination_cubit/examination_cubit.dart';
import 'package:clinic/features/examinatios_prices/presentation/widgets/examination_item.dart';
import 'package:clinic/features/home/domain/Entities/examination_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExaminationPageBody extends StatelessWidget {
  const ExaminationPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (context.read<ExaminationCubit>().state is ExaminationInitial ||
        context.read<ExaminationCubit>().state is ExaminationLoaded) {
      context.read<ExaminationCubit>().fetchExaminationDetails();
    }
    return BlocBuilder<ExaminationCubit, ExaminationState>(
      builder: (context, state) {
        if (state is ExaminationLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColor.primaryColor,
          ));
        } else if (state is ExaminationLoaded) {
          return ListView.builder(
            itemCount: state.details.length,
            itemBuilder: (context, index) {
              List<ExaminationDetail> data = state.details;
              data.sort((a, b) => a.type.typeName.compareTo(b.type.typeName));
              final detail = data[index];

              return ExaminationItem(detail: detail);
            },
          );
        } else if (state is ExaminationError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return const Center(child: Text('No data available.'));
      },
    );
  }
}
