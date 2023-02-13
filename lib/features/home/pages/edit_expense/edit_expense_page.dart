import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel_cost_log/app/core/enums.dart';
import 'package:travel_cost_log/app/injection_container.dart';
import 'package:travel_cost_log/data/data_sources/local_data_sources/expense_category_list.dart';
import 'package:travel_cost_log/domain/models/expense_model.dart';
import 'package:travel_cost_log/domain/models/voyage_model.dart';
import 'package:travel_cost_log/features/home/pages/edit_expense/cubit/edit_expense_cubit.dart';
import 'package:travel_cost_log/widgets/messages/snackbars.dart';

class EditExpensePage extends StatefulWidget {
  const EditExpensePage(
      {super.key, required this.expenseModel, required this.voyageModel});

  final ExpenseModel expenseModel;
  final VoyageModel voyageModel;

  @override
  State<EditExpensePage> createState() => _EditExpensePageState();
}

class _EditExpensePageState extends State<EditExpensePage> {
  String? _expenseName;
  String? _expenseVoyageTitle;
  double? _expensePrice;
  String? _expenseCategory;
  late DateTime _dateAdded;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    setState(() {
      _expenseName = widget.expenseModel.name;
      _expenseVoyageTitle = widget.voyageModel.title;
      _expensePrice = widget.expenseModel.price;
      _expenseCategory = widget.expenseModel.category;
      _dateAdded = widget.expenseModel.dateAdded;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditExpenseCubit>(
      create: (context) => getIt<EditExpenseCubit>()..getVoyageTitleStream(),
      child: BlocListener<EditExpenseCubit, EditExpenseState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).pop();
          }
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(ErrorSnackbar(
              text: state.successMessage ?? 'Success',
            ) as SnackBar);
          }
          if (state.successMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SuccessSnackbarr(
                text: state.successMessage ?? 'Success',
              ) as SnackBar,
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
                  _saveButton(context),
                ],
                // automaticallyImplyLeading: false,
              ),
              body: _EditExpensePageBody(
                formKey: formKey,
                expenseModel: widget.expenseModel,
                expenseName: _expenseName,
                onVoyageTitleChanged: (newValue) =>
                    setState(() => _expenseVoyageTitle = newValue),
                expenseVoyageTitle: _expenseVoyageTitle,
                expensePrice: _expensePrice,
                onCategoryChanged: (newValue) =>
                    setState(() => _expenseCategory = newValue),
                expenseCategory: _expenseCategory,
                categoryTitles: expenseCategoryList,
                voyageTitles: state.voyageTitles,
                dateAddedFormated: DateFormat.yMd().format(_dateAdded),
                onDateAddedChanged: ((selectedDate) {
                  setState(() => _dateAdded = selectedDate!);
                }),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _saveButton(BuildContext context) {
    return BlocBuilder<EditExpenseCubit, EditExpenseState>(
      builder: (context, state) {
        return state.formStatus == FormStatus.submitting
            ? const CircularProgressIndicator()
            : TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<EditExpenseCubit>().update(
                        expenseId: widget.expenseModel.id,
                        // name: state.name,
                        voyageTitle:
                            _expenseVoyageTitle ?? widget.voyageModel.title,
                        // price: state.price,
                        category: _expenseCategory ?? 'tickets',
                        dateAdded: _dateAdded);
                  }
                },
                child: const Text('Save'));
      },
    );
  }
}

class _EditExpensePageBody extends StatelessWidget {
  const _EditExpensePageBody({
    required this.formKey,
    required this.expenseModel,
    required this.onDateAddedChanged,
    this.dateAddedFormated,
    this.expenseName,
    required this.onVoyageTitleChanged,
    this.expenseVoyageTitle,
    this.expensePrice,
    required this.onCategoryChanged,
    this.expenseCategory,
    required this.categoryTitles,
    required this.voyageTitles,
    this.dateAdded,
  });

  final GlobalKey formKey;

  final Function(String?) onVoyageTitleChanged;

  final Function(String?) onCategoryChanged;
  final Function(DateTime?) onDateAddedChanged;

  final String? dateAddedFormated;

  final ExpenseModel expenseModel;
  final String? expenseName;
  final String? expenseVoyageTitle;
  final double? expensePrice;
  final String? expenseCategory;

  final List<String> categoryTitles;
  final List<String> voyageTitles;
  final DateTime? dateAdded;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              _nameField(),
              _priceField(),
              _dateField(context),
              _categoryField(),
              _voyageField()
            ],
          ),
        ),
      ),
    );
  }

  DropdownButtonFormField<String> _voyageField() {
    return DropdownButtonFormField<String>(
      value: expenseVoyageTitle,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Voyage',
        contentPadding: EdgeInsets.all(10),
      ),
      items: [
        ...voyageTitles.map(
          (String voyage) {
            return DropdownMenuItem(
              value: voyage,
              child: Text(
                voyage[0].toUpperCase() + voyage.substring(1),
              ),
            );
          },
        )
      ],
      onChanged: onVoyageTitleChanged,
      validator: (value) => null,
    );
  }

  TextFormField _dateField(BuildContext context) {
    return TextFormField(
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
        onDateAddedChanged(selectedDate);
      },
      validator: (value) => null,
    );
  }

  DropdownButtonFormField<String> _categoryField() {
    return DropdownButtonFormField<String>(
      value: expenseModel.category,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Category',
        contentPadding: EdgeInsets.all(10),
      ),
      items: [
        ...categoryTitles.map(
          (String category) {
            return DropdownMenuItem(
              value: category,
              child: Text(
                category[0].toUpperCase() + category.substring(1),
              ),
            );
          },
        ),
      ],
      onChanged: onCategoryChanged,
      validator: (value) => null,
    );
  }

  Widget _priceField() {
    return BlocBuilder<EditExpenseCubit, EditExpenseState>(
      builder: (context, state) {
        return TextFormField(
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
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          onChanged: (value) {
            final price = double.tryParse(value);
            context.read<EditExpenseCubit>().changePrice(price: price ?? 0);
          },
          validator: (value) =>
              state.isPriceValid ? null : 'Please enter expense amount',
        );
      },
    );
  }

  Widget _nameField() {
    return BlocBuilder<EditExpenseCubit, EditExpenseState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: expenseModel.name,
          onChanged: ((value) {
            context.read<EditExpenseCubit>().changeName(name: value);
          }),
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Expense name',
            contentPadding: EdgeInsets.all(10),
          ),
          validator: (value) =>
              state.isNameValid ? null : 'Please enter expense name',
        );
      },
    );
  }
}
