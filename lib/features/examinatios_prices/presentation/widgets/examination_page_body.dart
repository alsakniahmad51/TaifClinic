import 'package:clinic/features/home/presentation/widgets/offlin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic/core/util/constants.dart';
import 'package:clinic/features/examinatios_prices/presentation/manager/examination_cubit/examination_cubit.dart';
import 'package:clinic/features/examinatios_prices/presentation/manager/output_cubit/output_cubit.dart';
import 'package:clinic/features/examinatios_prices/presentation/widgets/examination_item.dart';
import 'package:clinic/features/examinatios_prices/presentation/widgets/output_item.dart';

class ExaminationPageBody extends StatelessWidget {
  const ExaminationPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final examinationCubit = context.read<ExaminationCubit>();
    final outputCubit = context.read<OutputCubit>();

    if (examinationCubit.state is ExaminationInitial) {
      examinationCubit.fetchExaminationDetails();
    }
    if (outputCubit.state is OutputInitial) {
      outputCubit.fetchOutputDetails();
    }

    return BlocBuilder<ExaminationCubit, ExaminationState>(
      builder: (context, examinationState) {
        return BlocBuilder<OutputCubit, OutputState>(
          builder: (context, outputState) {
            if (examinationState is ExaminationLoading ||
                outputState is OutputLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColor.primaryColor),
              );
            }

            if (examinationState is ExaminationError) {
              if (examinationState.message.contains("SocketException")) {
                return OfflinPage(onTap: () {
                  BlocProvider.of<ExaminationCubit>(context)
                      .fetchExaminationDetails();
                  BlocProvider.of<OutputCubit>(context).fetchOutputDetails();
                });
              }
              return Center(
                child:
                    Text('Error in Examination: ${examinationState.message}'),
              );
            }
            if (outputState is OutputError) {
              if (outputState.message.contains("SocketException")) {
                return OfflinPage(onTap: () {
                  BlocProvider.of<ExaminationCubit>(context)
                      .fetchExaminationDetails();
                  BlocProvider.of<OutputCubit>(context).fetchOutputDetails();
                });
              }
              return Center(
                child: Text('Error in Output: ${outputState.message}'),
              );
            }

            if (examinationState is ExaminationLoaded &&
                outputState is OutputLoaded) {
              final examinationDetails = examinationState.details;
              final outputDetails = outputState.output;

              return CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ExaminationItem(
                          detail: examinationDetails[index],
                        );
                      },
                      childCount: examinationDetails.length,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return OutputItem(
                          output: outputDetails[index],
                        );
                      },
                      childCount: outputDetails.length,
                    ),
                  ),
                ],
              );
            }

            return const Center(
              child: Text('No data available.'),
            );
          },
        );
      },
    );
  }
}
