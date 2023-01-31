import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel_cost_log/app/injection_container.dart';
import 'package:travel_cost_log/data/data_sources/local_data_sources/expense_category_list.dart';
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
  String? _expenseVoyageTitle;
  double? _expensePrice;
  String? _expenseCategory;
  DateTime? _dateAdded;

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
                expenseModel: widget.expenseModel,
                expenseName: _expenseName,
                onNameChanged: (newValue) =>
                    setState(() => _expenseName = newValue),
                onVoyageTitleChanged: (newValue) => setState(() {
                  _expenseVoyageTitle = newValue;
                }),
                expenseVoyageTitle: _expenseVoyageTitle,
                onPriceChanged: (newValue) =>
                    setState(() => _expensePrice = newValue),
                expensePrice: _expensePrice,
                onCategoryChanged: (newValue) =>
                    setState(() => _expenseCategory = newValue),
                expenseCategory: _expenseCategory,
                categoryTitles: expenseCategoryList,
                voyageTitles: state.voyageTitles,
                voyageModel: null,
                dateAddedFormated: DateFormat.yMd().format(
                  _dateAdded ?? widget.expenseModel.dateAdded,
                ),
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
                onDateAddedChanged: ((dateAdded) {
                  // context
                  //     .read<EditExpenseCubit>()
                  //     .changeStartDateValue(startDate);
                }),
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
    required this.expenseModel,
    // required this.onBudgetChanged,
    required this.onDateAddedChanged,
    this.dateAddedFormated,
    // required this.onEndDateChanged,
    // this.endDateFormated,
    this.expenseName,
    required this.onNameChanged,
    required this.onVoyageTitleChanged,
    this.expenseVoyageTitle,
    required this.onPriceChanged,
    this.expensePrice,
    required this.onCategoryChanged,
    this.expenseCategory,
    required this.categoryTitles,
    required this.voyageTitles,
    this.dateAdded,
    this.voyageModel,
  });

  final Function(String?) onNameChanged;
  final Function(String?) onVoyageTitleChanged;
  final Function(double?) onPriceChanged;
  final Function(String?) onCategoryChanged;
  final Function(DateTime?) onDateAddedChanged;

  final String? dateAddedFormated;

  final ExpenseModel expenseModel;
  final String? expenseName;
  final String? expenseVoyageTitle;
  final double? expensePrice;
  final String? expenseCategory;
  final VoyageModel? voyageModel;

  final List<String> categoryTitles;
  final List<String> voyageTitles;
  final DateTime? dateAdded;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextFormField(
              initialValue: expenseModel.name,
              onChanged: onNameChanged,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Expense name',
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            TextFormField(
              initialValue: expenseModel.price.toString(),
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
                controller: TextEditingController(text: dateAddedFormated),
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
                value: expenseCategory,
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
                value: expenseVoyageTitle,
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
