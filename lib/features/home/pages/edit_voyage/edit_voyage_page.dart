import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:voyage_vault/app/injection_container.dart';
import 'package:voyage_vault/components/save_app_bar_button.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:voyage_vault/features/home/pages/edit_voyage/cubit/edit_voyage_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:voyage_vault/features/home/pages/edit_voyage/edit_voyage_page_body.dart';

@immutable
class EditVoyagePage extends StatelessWidget {
  const EditVoyagePage({super.key, required this.voyageModel});

  final VoyageModel voyageModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditVoyageCubit>(
      create: (context) =>
          getIt<EditVoyageCubit>()..start(voyageModel: voyageModel),
      child: BlocListener<EditVoyageCubit, EditVoyageState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).pop();
          }
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage ?? 'Unknown error',
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (state.successMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Icon(Icons.done),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      state.successMessage ?? 'Success',
                    ),
                  ],
                ),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        child: BlocBuilder<EditVoyageCubit, EditVoyageState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                    '${AppLocalizations.of(context).edit} ${AppLocalizations.of(context).voyage}'),
                actions: [
                  SaveAppBarButton(
                    onPressed: (() async {
                      context.read<EditVoyageCubit>().updateVoyageAndCheck(
                            voyageId: voyageModel.id,
                            initialTitle: voyageModel.title,
                            title: state.title,
                            budget: state.budget,
                            startDate: state.startDate ?? voyageModel.startDate,
                            endDate: state.endDate ?? voyageModel.endDate,
                            location: state.location ?? voyageModel.location,
                            description:
                                state.description ?? voyageModel.description,
                          );
                    }),
                  ),
                ],
                // automaticallyImplyLeading: false,
              ),
              body: EditVoyagePageBody(
                startDateFormated: DateFormat.yMd().format(
                  state.startDate ?? DateTime(2020),
                ),
                endDateFormated: DateFormat?.yMd().format(
                  state.endDate ?? DateTime(2020),
                ),
                voyageTitle: state.title,
                voyageBudget: state.budget,
                voyageStartDate: state.startDate,
                voyageEndDate: state.endDate,
                voyageTitles: state.voyageTitles,
                voyageLocation: state.location,
                voyageDescription: state.description,
                onEndDateChanged: ((endDate) {
                  context.read<EditVoyageCubit>().changeEndDateValue(endDate);
                }),
                onStartDateChanged: ((startDate) {
                  context
                      .read<EditVoyageCubit>()
                      .changeStartDateValue(startDate);
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}
