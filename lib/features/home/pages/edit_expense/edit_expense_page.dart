import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel_cost_log/app/injection_container.dart';
import 'package:travel_cost_log/domain/models/expense_model.dart';
import 'package:travel_cost_log/domain/models/voyage_model.dart';
import 'package:travel_cost_log/features/home/pages/edit_expense/cubit/edit_expense_cubit.dart';

class EditExpensePage extends StatefulWidget {
  const EditExpensePage({super.key, required this.expenseModel});

  final ExpenseModel expenseModel;

  @override
  State<EditExpensePage> createState() => _EditExpensePageState();
}

class _EditExpensePageState extends State<EditExpensePage> {
  String? _expenseName;

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
                expenseName: _expenseName,
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
  const _EditExpensePageBody({
    // required this.onBudgetChanged,
    // required this.onStartDateChanged,
    // this.startDateFormated,
    // required this.onEndDateChanged,
    // this.endDateFormated,
    this.expenseName,
    // this.voyageBudget,
    // this.voyageStartDate,
    // this.voyageEndDate,
    // required this.voyageTitles,
    // this.voyageLocation,
    // this.voyageDescription,
  });

  // final Function(DateTime?) onStartDateChanged;
  // final Function(DateTime?) onEndDateChanged;

  // final String? startDateFormated;
  // final String? endDateFormated;

  final String? expenseName;
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
              initialValue: 'Name',
              onChanged: ((value) {
                // context.read<EditExpenseCubit>().changeTitleValue(value);
              }),
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Expense name',
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            TextFormField(
              initialValue: 'Price'.toString(),
              textAlign: TextAlign.start,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Price',
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
            TextField(
                // controller: TextEditingController(
                // text: voyageEndDate != null ? endDateFormated : null),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  icon: Icon(
                    Icons.calendar_today,
                  ),
                  labelText: "Spent Date",
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
            DropdownButtonFormField<String>(
                value: 'expenseCategory',
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Category',
                  contentPadding: EdgeInsets.all(10),
                ),
                items: [
                  // if (expenseCategory == null)
                  //   const DropdownMenuItem(
                  //     child: Text('Choose from list'),
                  //   ),
                  // ...categoryTitles.map((String category) {
                  //   return DropdownMenuItem(
                  //     value: category,
                  //     child: Text(
                  //       category[0].toUpperCase() + category.substring(1),
                  //     ),
                  //   );
                  // }),
                ],
                onChanged: (t) {}
                //  onCategoryChanged,
                ),
            // if (voyageModel == null)
            DropdownButtonFormField<String>(
                value: 'expenseVoyageTitle',
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Voyage',
                  contentPadding: EdgeInsets.all(10),
                ),
                items: [
                  // if (voyageModel == null)
                  // if (expenseVoyageTitle == null)
                  //   const DropdownMenuItem(
                  //     child: Text('Choose voyage from list'),
                  //   ),
                  // ...voyageTitles.map((String voyage) {
                  //   return DropdownMenuItem(
                  //     value: voyage,
                  //     child: Text(
                  //       voyage[0].toUpperCase() + voyage.substring(1),
                  //     ),
                  //   );
                  // })
                  // else
                  //   DropdownMenuItem(
                  //     child: Text(voyageModel!.title),
                  //   )
                ],
                onChanged: (t) {}
                // onVoyageTitleChanged,
                )
          ],
        ),
      ),
    );
  }
}
