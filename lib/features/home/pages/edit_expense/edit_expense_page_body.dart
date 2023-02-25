import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage_vault/domain/models/expense_model.dart';
import 'package:voyage_vault/features/global_widgets/select_date_form_field.dart';
import 'package:voyage_vault/features/home/pages/edit_expense/cubit/edit_expense_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@immutable
class EditExpensePageBody extends StatelessWidget {
  const EditExpensePageBody({
    super.key,
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

  // Widget _dateField() {
  //   return BlocBuilder<EditExpenseCubit, EditExpenseState>(
  //     builder: (context, state) {
  //       return TextFormField(
  //         controller: TextEditingController(text: state.dateAddedFormated),
  //         decoration: InputDecoration(
  //           border: const UnderlineInputBorder(),
  //           icon: const Icon(
  //             Icons.calendar_today,
  //           ),
  //           labelText: AppLocalizations.of(context).spentDate,
  //           contentPadding: const EdgeInsets.all(10),
  //         ),
  //         readOnly: true, // when true user cannot edit text
  //         onTap: () async {
  //           await showDatePicker(
  //             context: context,
  //             initialDate: state.dateAdded ?? DateTime.now(),
  //             firstDate: DateTime(2020),
  //             lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
  //           ).then((selectedDate) {
  //             if (selectedDate != null) {
  //               context
  //                   .read<EditExpenseCubit>()
  //                   .changeDateAdded(dateAdded: selectedDate);
  //             }
  //           });
  //         },
  //       );
  //     },
  //   );
  // }

  Widget _dateField() {
    return BlocBuilder<EditExpenseCubit, EditExpenseState>(
      builder: (context, state) {
        return selectDateFormField(
          context: context,
          controllerText: state.dateAddedFormated,
          labelText: AppLocalizations.of(context).spentDate,
          changeDate: (selectedDate) => context
              .read<EditExpenseCubit>()
              .changeDateAdded(dateAdded: selectedDate),
          initialDate: state.dateAdded,
          //TODO: Add validator
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
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: AppLocalizations.of(context).price,
            contentPadding: const EdgeInsets.all(10),
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
          validator: (value) => state.isPriceValid
              ? null
              : AppLocalizations.of(context).pleaseEnterExpenseAmount,
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
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: AppLocalizations.of(context).expenseName,
            contentPadding: const EdgeInsets.all(10),
          ),
          validator: (value) => state.isNameValid
              ? null
              : AppLocalizations.of(context).pleaseEnterExpenseName,
        );
      },
    );
  }
}
