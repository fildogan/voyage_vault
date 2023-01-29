import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel_cost_log/app/injection_container.dart';
import 'package:travel_cost_log/domain/models/voyage_model.dart';
import 'package:travel_cost_log/features/home/pages/edit_expense/cubit/edit_expense_cubit.dart';

class EditExpensePage extends StatelessWidget {
  const EditExpensePage({super.key, required this.voyageModel});

  final VoyageModel voyageModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditExpenseCubit>(
      create: (context) => getIt<EditExpenseCubit>(),
      child: BlocListener<EditExpenseCubit, EditExpenseState>(
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
        child: BlocBuilder<EditExpenseCubit, EditExpenseState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: const Text('Edit Expense'),
                actions: [
                  TextButton(
                      onPressed: (() {
                        // context.read<EditExpenseCubit>().updateVoyageAndCheck(
                        //       voyageId: voyageModel.id,
                        //       initialTitle: voyageModel.title,
                        //       title: state.title,
                        //       budget: state.budget,
                        //       startDate:
                        //           state.startDate ?? voyageModel.startDate,
                        //       endDate: state.endDate ?? voyageModel.endDate,
                        //       location: state.location ?? voyageModel.location,
                        //       description:
                        //           state.description ?? voyageModel.description,
                        //     );
                      }),
                      child: const Text('Save')),
                ],
                // automaticallyImplyLeading: false,
              ),
              body: _EditExpensePageBody(
                  // startDateFormated: DateFormat.yMd().format(
                  //   state.startDate ?? DateTime(2020),
                  // ),
                  // endDateFormated: DateFormat?.yMd().format(
                  //   state.endDate ?? DateTime(2020),
                  // ),
                  // voyageTitle: state.title,
                  // voyageBudget: state.budget,
                  // voyageStartDate: state.startDate,
                  // voyageEndDate: state.endDate,
                  // voyageTitles: state.voyageTitles,
                  // voyageLocation: state.location,
                  // voyageDescription: state.description,
                  // onEndDateChanged: ((endDate) {
                  //   context.read<EditExpenseCubit>().changeEndDateValue(endDate);
                  // }),
                  // onStartDateChanged: ((startDate) {
                  //   context
                  //       .read<EditExpenseCubit>()
                  //       .changeStartDateValue(startDate);
                  // }),
                  ),
            );
          },
        ),
      ),
    );
  }
}

class _EditExpensePageBody extends StatelessWidget {
  const _EditExpensePageBody(
      // required this.onBudgetChanged,
      // required this.onStartDateChanged,
      // this.startDateFormated,
      // required this.onEndDateChanged,
      // this.endDateFormated,
      // this.voyageTitle,
      // this.voyageBudget,
      // this.voyageStartDate,
      // this.voyageEndDate,
      // required this.voyageTitles,
      // this.voyageLocation,
      // this.voyageDescription,
      );

  // final Function(DateTime?) onStartDateChanged;
  // final Function(DateTime?) onEndDateChanged;

  // final String? startDateFormated;
  // final String? endDateFormated;

  // final String? voyageTitle;
  // final double? voyageBudget;
  // final DateTime? voyageStartDate;
  // final DateTime? voyageEndDate;
  // final String? voyageLocation;
  // final String? voyageDescription;

  // final List<String> voyageTitles;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextFormField(
              initialValue: 'voyageTitle',
              onChanged: ((value) {
                // context.read<EditExpenseCubit>().changeTitleValue(value);
              }),
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Voyage name',
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            TextFormField(
              initialValue: 'voyageLocation',
              onChanged: ((value) {
                // context.read<EditExpenseCubit>().changeLocationValue(value);
              }),
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Destination',
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            TextFormField(
              initialValue: 'voyageBudget'.toString(),
              textAlign: TextAlign.start,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Budget',
                contentPadding: EdgeInsets.all(10),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'^\d*\.?\d{0,2}'),
                ),
              ],
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                // final budget = double.tryParse(value);

                // context.read<EditExpenseCubit>().changeBudgetValue(budget);
              },
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                      // controller: TextEditingController(
                      //     text: voyageStartDate != null
                      //         ? startDateFormated
                      //         : null),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.calendar_today),
                        labelText: "Start Date",
                        contentPadding: EdgeInsets.all(10),
                      ),
                      readOnly: true, // when true user cannot edit text
                      onTap: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime.now().add(
                            const Duration(days: 365 * 10),
                          ),
                        );
                        // onStartDateChanged(selectedDate);
                      }),
                ),
                const SizedBox(
                  width: 30,
                ),
                Flexible(
                  child: TextField(
                      // controller: TextEditingController(
                      // text: voyageEndDate != null ? endDateFormated : null),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.calendar_today),
                        labelText: "End Date",
                        contentPadding: EdgeInsets.all(10),
                      ),
                      readOnly: true, // when true user cannot edit text
                      onTap: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime.now().add(
                            const Duration(days: 365 * 10),
                          ),
                        );
                        // onEndDateChanged(selectedDate);
                      }),
                ),
              ],
            ),
            TextFormField(
              initialValue: 'voyageDescription',
              onChanged: ((value) {
                // context.read<EditExpenseCubit>().changeDescriptionValue(value);
              }),
              maxLines: null,
              minLines: 3,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
                labelStyle: TextStyle(),
                alignLabelWithHint: true,
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
