import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage_vault/components/add_edit_form_body.dart';
import 'package:voyage_vault/components/text_form_field_decoration.dart';
import 'package:voyage_vault/domain/models/expense_model.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:voyage_vault/domain/models/voyager_model.dart';
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
      child: AddEditFormBody(
        formKey: formKey,
        children: [
          _nameField(),
          _priceField(),
          _dateField(),
          _categoryField(),
          // _voyageField(),
          voyageField(),
          voyagerField(),
        ],
      ),
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

  Widget voyageField() {
    return BlocBuilder<EditExpenseCubit, EditExpenseState>(
      builder: (context, state) {
        return DropdownButtonFormField<VoyageModel>(
          value: state.voyage,
          decoration: textFormFieldDecoration(
            context,
            labelText: AppLocalizations.of(context).voyage,
          ),
          items: [
            ...state.voyages.map(
              (VoyageModel voyage) {
                return DropdownMenuItem(
                  value: voyage,
                  child: Text(
                    voyage.title[0].toUpperCase() + voyage.title.substring(1),
                  ),
                );
              },
            )
          ],
          onChanged: ((value) =>
              context.read<EditExpenseCubit>().changeVoyage(voyage: value!)),
          validator: (value) => state.isVoyageValid
              ? null
              : AppLocalizations.of(context).pleaseChooseVoyage,
        );
      },
    );
  }

  Widget voyagerField() {
    return BlocBuilder<EditExpenseCubit, EditExpenseState>(
      builder: (context, state) {
        return IgnorePointer(
          ignoring: state.voyage == null,
          child: DropdownButtonFormField<VoyagerModel>(
            value: state.voyager,
            decoration: textFormFieldDecoration(context,
                labelText: AppLocalizations.of(context).voyager,
                enabled: state.voyage != null),
            items: (state.voyage == null ||
                    state.voyage?.voyagers == null ||
                    state.voyagers.isEmpty)
                ? [
                    const DropdownMenuItem(
                      child: Text('Choose a voyage first'),
                    )
                  ]
                : [
                    ...state.voyagers.map(
                      (VoyagerModel voyager) {
                        return DropdownMenuItem(
                          value: voyager,
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: voyager.color,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                voyager.name[0].toUpperCase() +
                                    voyager.name.substring(1),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],

            onChanged: ((value) => context
                .read<EditExpenseCubit>()
                .changeVoyager(voyager: value!)),

            // validator: (value) => state.isVoyageValid
            //     ? null
            //     : AppLocalizations.of(context).pleaseChooseVoyage,
          ),
        );
      },
    );
  }
}
