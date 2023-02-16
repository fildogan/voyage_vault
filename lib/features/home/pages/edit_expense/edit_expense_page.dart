import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/app/injection_container.dart';
import 'package:voyage_vault/domain/models/expense_model.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:voyage_vault/features/home/pages/edit_expense/cubit/edit_expense_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditExpensePage extends StatelessWidget {
  EditExpensePage({
    super.key,
    required this.expenseModel,
    required this.voyageModel,
  });

  final ExpenseModel expenseModel;
  final VoyageModel voyageModel;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditExpenseCubit>(
      create: (context) => getIt<EditExpenseCubit>()
        ..start(expenseModel: expenseModel, voyageModel: voyageModel),
      child: BlocListener<EditExpenseCubit, EditExpenseState>(
        listener: (context, state) {
          if (state.formStatus == FormStatus.success) {
            Navigator.of(context).pop();
          }
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage ?? 'Unknown Error'),
            ));
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
                    Text(state.successMessage ?? 'Success')
                  ],
                ),
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
                  _saveButton(context),
                ],
                // automaticallyImplyLeading: false,
              ),
              body: _EditExpensePageBody(
                formKey: formKey,
                expenseModel: expenseModel,
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
        return TextButton(
            onPressed: state.formStatus == FormStatus.submitting
                ? null
                : () {
                    if (formKey.currentState!.validate()) {
                      context.read<EditExpenseCubit>().update();
                    }
                  },
            child: Text(AppLocalizations.of(context).save));
      },
    );
  }
}

class _EditExpensePageBody extends StatelessWidget {
  const _EditExpensePageBody({
    required this.formKey,
    required this.expenseModel,
  });

  final GlobalKey formKey;

  final ExpenseModel expenseModel;

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
              _dateField(),
              _categoryField(),
              _voyageField()
            ],
          ),
        ),
      ),
    );
  }

  Widget _voyageField() {
    return BlocBuilder<EditExpenseCubit, EditExpenseState>(
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          value: state.voyageTitle,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: AppLocalizations.of(context).voyage,
            contentPadding: const EdgeInsets.all(10),
          ),
          items: [
            ...state.voyageTitles.map(
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
          onChanged: ((value) => context
              .read<EditExpenseCubit>()
              .changeVoyageTitle(voyageTitle: value ?? state.voyageTitle)),
        );
      },
    );
  }

  Widget _dateField() {
    return BlocBuilder<EditExpenseCubit, EditExpenseState>(
      builder: (context, state) {
        return TextFormField(
          controller: TextEditingController(text: state.dateAddedFormated),
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
              initialDate: state.dateAdded ?? DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
            );
            if (selectedDate != null) {
              context
                  .read<EditExpenseCubit>()
                  .changeDateAdded(dateAdded: selectedDate);
            }
          },
        );
      },
    );
  }

  Widget _categoryField() {
    return BlocBuilder<EditExpenseCubit, EditExpenseState>(
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          value: expenseModel.category,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: AppLocalizations.of(context).category,
            contentPadding: const EdgeInsets.all(10),
          ),
          items: [
            ...state.categoryTitles.map(
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
          onChanged: ((value) => context
              .read<EditExpenseCubit>()
              .changeCategory(category: value ?? expenseModel.category)),
          validator: (value) => null,
        );
      },
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
          onChanged: (value) {
            context.read<EditExpenseCubit>().changeName(name: value);
          },
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
