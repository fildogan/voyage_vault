import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_cost_log/app/core/enums.dart';
import 'package:travel_cost_log/app/injection_container.dart';
import 'package:travel_cost_log/data/data_sources/local_data_sources/expense_category_list.dart';
import 'package:travel_cost_log/domain/models/voyage_model.dart';
import 'package:travel_cost_log/features/home/pages/add_expense/cubit/add_expense_cubit.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key, this.voyageModel});

  final VoyageModel? voyageModel;

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  String? _expenseName;
  String? _expenseVoyageTitle;
  double? _expensePrice;
  String? _expenseCategory;

  @override
  Widget build(BuildContext context) {
    if (widget.voyageModel != null) {
      _expenseVoyageTitle = widget.voyageModel?.title ?? '';
    }
    return BlocProvider<AddExpenseCubit>(
      create: (context) => getIt<AddExpenseCubit>()..getVoyageTitleStream(),
      child: BlocListener<AddExpenseCubit, AddExpenseState>(
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
        },
        child: BlocBuilder<AddExpenseCubit, AddExpenseState>(
            builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const Text('Add an expense'),
              actions: [
                TextButton(
                    onPressed: _expenseName == null ||
                            _expenseVoyageTitle == null ||
                            _expensePrice == null ||
                            _expenseCategory == null
                        ? () {
                            context
                                .read<AddExpenseCubit>()
                                .error('Please fill all fields');
                            // context
                            //     .read<AddExpenseCubit>()
                            //     .getVoyageTitleStream();
                          }
                        : () {
                            context
                                .read<AddExpenseCubit>()
                                .addExpenseByVoyageTitle(
                                  _expenseName ?? '',
                                  _expenseVoyageTitle ?? '',
                                  _expensePrice ?? 0.00,
                                  _expenseCategory ?? 'miscellaneous',
                                );
                          },
                    child: const Text('Save'))
              ],
            ),
            body: Builder(
              builder: (context) {
                switch (state.status) {
                  case Status.initial:
                    return const Scaffold(
                      body: Center(
                        child: Text('Initial state'),
                      ),
                    );
                  case Status.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case Status.success:
                    if (state.voyageTitles.isEmpty) {
                      return const Center(
                        child: Text('No voyages found'),
                      );
                    }
                    return _AddExpensePageBody(
                      onNameChanged: (newValue) =>
                          setState(() => _expenseName = newValue),
                      expenseName: _expenseName,
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
                      voyageModel: widget.voyageModel,
                      addExpense: (title) {
                        context.read<AddExpenseCubit>().addExpenseByVoyageTitle(
                              _expenseName!,
                              title!,
                              _expensePrice!,
                              _expenseCategory!,
                            );
                      },
                    );
                  case Status.error:
                    return Center(
                      child: Text(
                        state.errorMessage ?? 'Unknown error',
                        style: TextStyle(
                          color: Theme.of(context).errorColor,
                        ),
                      ),
                    );
                }
              },
            ),
          );
        }),
      ),
    );
  }
}

class _AddExpensePageBody extends StatelessWidget {
  const _AddExpensePageBody({
    required this.onNameChanged,
    this.expenseName,
    required this.onVoyageTitleChanged,
    this.expenseVoyageTitle,
    required this.onPriceChanged,
    this.expensePrice,
    required this.onCategoryChanged,
    this.expenseCategory,
    required this.categoryTitles,
    required this.voyageTitles,
    required this.addExpense,
    this.voyageModel,
  });

  final Function(String?) onNameChanged;
  final Function(String?) onVoyageTitleChanged;
  final Function(double?) onPriceChanged;
  final Function(String?) onCategoryChanged;
  final Function(String?) addExpense;

  final String? expenseName;
  final String? expenseVoyageTitle;
  final double? expensePrice;
  final String? expenseCategory;
  final VoyageModel? voyageModel;

  final List<String> categoryTitles;
  final List<String> voyageTitles;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              onChanged: onNameChanged,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Expense name',
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            TextField(
              textAlign: TextAlign.end,
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
                final price = double.tryParse(value);
                if (price != null) {
                  onPriceChanged(price);
                }
              },
            ),
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
                ...categoryTitles.map((String category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(
                      category[0].toUpperCase() + category.substring(1),
                    ),
                  );
                }),
              ],
              onChanged: onCategoryChanged,
            ),
            if (voyageModel == null)
              DropdownButtonFormField<String>(
                value: expenseVoyageTitle,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Voyage',
                  contentPadding: EdgeInsets.all(10),
                ),
                items: [
                  // if (expenseVoyageTitle == null)
                  //   const DropdownMenuItem(
                  //     child: Text('Choose voyage from list'),
                  //   ),
                  ...voyageTitles.map((String voyage) {
                    return DropdownMenuItem(
                      value: voyage,
                      child: Text(
                        voyage[0].toUpperCase() + voyage.substring(1),
                      ),
                    );
                  }),
                ],
                onChanged: onVoyageTitleChanged,
              )
            else
              Text(voyageModel!.title),
            // ElevatedButton(
            //   onPressed: expenseName == null ||
            //           expenseVoyageTitle == null ||
            //           expensePrice == null ||
            //           expenseCategory == null
            //       ? () {
            //           context
            //               .read<AddExpenseCubit>()
            //               .error('Please fill all fields');
            //           context.read<AddExpenseCubit>().getVoyageTitleStream();
            //         }
            //       : () {
            //           addExpense(expenseVoyageTitle);

            //           // context.read<AddExpenseCubit>().add(
            //           //       expenseName!,
            //           //       expensevoyageId!,
            //           //       expensePrice!,
            //           //       expenseCategory!,
            //           //     );
            //         },
            //   child: const Text('Add Expense'),
            // )
          ],
        ),
      ),
    );
  }
}
