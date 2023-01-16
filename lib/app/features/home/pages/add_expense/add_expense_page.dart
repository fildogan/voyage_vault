import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_cost_log/app/features/home/pages/add_expense/cubit/add_expense_cubit.dart';
import 'package:travel_cost_log/app/repositories/expense_categories_repository.dart';
import 'package:travel_cost_log/app/repositories/expenses_repository.dart';
import 'package:travel_cost_log/app/repositories/voyages_repository.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  String? _expenseName;
  String? _expenseVoyageID;
  double? _expensePrice;
  String? _expenseCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AddExpenseCubit(
          ExpensesRepository(),
          ExpenseCategoriesRepository(),
          VoyagesRepository(),
        )..getCategoryList().then(
            (value) => AddExpenseCubit(
              ExpensesRepository(),
              ExpenseCategoriesRepository(),
              VoyagesRepository(),
            )..getVoyageTitleStream(),
          ),
        child: BlocListener<AddExpenseCubit, AddExpenseState>(
          listener: (context, state) {
            if (state.saved) {
              Navigator.of(context).pop();
            }
            if (state.errorMessage.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.errorMessage,
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: BlocBuilder<AddExpenseCubit, AddExpenseState>(
            builder: (context, state) {
              final voyageTitleList = state.voyageTitles;
              return _AddExpensePageBody(
                onNameChanged: (newValue) =>
                    setState(() => _expenseName = newValue),
                expenseName: _expenseName,
                onVoyageIDChanged: (newValue) =>
                    setState(() => _expenseVoyageID = newValue),
                expenseVoyageID: _expenseVoyageID,
                onPriceChanged: (newValue) =>
                    setState(() => _expensePrice = newValue),
                expensePrice: _expensePrice,
                onCategoryChanged: (newValue) =>
                    setState(() => _expenseCategory = newValue),
                expenseCategory: _expenseCategory,
                categoryTitles: state.categoryTitles,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _AddExpensePageBody extends StatelessWidget {
  const _AddExpensePageBody({
    required this.onNameChanged,
    this.expenseName,
    required this.onVoyageIDChanged,
    this.expenseVoyageID,
    required this.onPriceChanged,
    this.expensePrice,
    required this.onCategoryChanged,
    this.expenseCategory,
    required this.categoryTitles,
  });

  final Function(String?) onNameChanged;
  final Function(String?) onVoyageIDChanged;
  final Function(double?) onPriceChanged;
  final Function(String?) onCategoryChanged;

  final String? expenseName;
  final String? expenseVoyageID;
  final double? expensePrice;
  final String? expenseCategory;

  final List<String> categoryTitles;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: TextField(
                onChanged: onNameChanged,
              ),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                textAlign: TextAlign.end,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
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
            ),
            DropdownButton<String>(
              value: expenseCategory,
              items: [
                if (expenseCategory == null)
                  const DropdownMenuItem(
                    child: Text('Choose from list'),
                  ),
                ...categoryTitles.map((String category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }),
              ],
              onChanged: onCategoryChanged,
            ),
            ElevatedButton(
              onPressed: expenseName == null || expensePrice == null
                  ? () {
                      Navigator.of(context).pop();
                    }
                  : () => context
                      .read<AddExpenseCubit>()
                      .add(expenseName!, '', expensePrice!, ''),
              child: const Text('Add Expense'),
            )
          ],
        ),
      ),
    );
  }
}
