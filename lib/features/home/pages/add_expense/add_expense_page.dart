import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/app/injection_container.dart';
import 'package:voyage_vault/components/add_edit_app_bar.dart';
import 'package:voyage_vault/components/add_edit_form_body.dart';
import 'package:voyage_vault/components/text_form_field_decoration.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:voyage_vault/features/home/pages/add_expense/cubit/add_expense_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@immutable
class AddExpensePage extends StatelessWidget {
  AddExpensePage({super.key, this.voyageModel});

  final VoyageModel? voyageModel;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void Function()? saveExpense;
    return BlocProvider<AddExpenseCubit>(
      create: (context) => getIt<AddExpenseCubit>()..start(voyageModel),
      child: BlocListener<AddExpenseCubit, AddExpenseState>(
        listener: (context, state) {
          if (state.formStatus == FormStatus.success) {
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
                    Text(state.successMessage ?? 'Success')
                  ],
                ),
              ),
            );
          }
        },
        child: BlocBuilder<AddExpenseCubit, AddExpenseState>(
            builder: (context, state) {
          saveExpense = state.formStatus == FormStatus.initial
              ? () {
                  if (formKey.currentState!.validate()) {
                    context.read<AddExpenseCubit>().add();
                  }
                }
              : null;
          return Scaffold(
              appBar: AddEditAppBar(
                title: AppLocalizations.of(context).addExpense,
                saveAction: saveExpense,
                appBar: AppBar(),
              ),
              body: _AddExpensePageBody(
                formKey: formKey,
              ));
        }),
      ),
    );
  }
}

class _AddExpensePageBody extends StatelessWidget {
  const _AddExpensePageBody({
    required this.formKey,
  });

  final GlobalKey formKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AddEditFormBody(
        formKey: formKey,
        children: [
          nameField(),
          priceField(),
          categoryField(),
          voyageField(),
        ],
      ),
    );
  }

  Widget nameField() {
    return BlocBuilder<AddExpenseCubit, AddExpenseState>(
      builder: (context, state) {
        return TextFormField(
          decoration: textFormFieldDecoration(
            context,
            labelText: AppLocalizations.of(context).expenseName,
          ),
          onChanged: (value) {
            context.read<AddExpenseCubit>().changeName(name: value);
          },
          validator: (value) => state.isNameValid
              ? null
              : AppLocalizations.of(context).pleaseEnterExpenseName,
        );
      },
    );
  }

  Widget priceField() {
    return BlocBuilder<AddExpenseCubit, AddExpenseState>(
      builder: (context, state) {
        return TextFormField(
          textAlign: TextAlign.start,
          decoration: textFormFieldDecoration(
            context,
            labelText: AppLocalizations.of(context).price,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              RegExp(r'^\d*\.?\d{0,2}'),
            ),
          ],
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          onChanged: (value) {
            final price = double.tryParse(value);
            context.read<AddExpenseCubit>().changePrice(price: price ?? 0);
          },
          validator: (value) => state.isPriceValid
              ? null
              : AppLocalizations.of(context).pleaseEnterExpenseAmount,
        );
      },
    );
  }

  Widget categoryField() {
    return BlocBuilder<AddExpenseCubit, AddExpenseState>(
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          value: state.category,
          decoration: textFormFieldDecoration(
            context,
            labelText: AppLocalizations.of(context).category,
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
          onChanged: ((value) =>
              context.read<AddExpenseCubit>().changeCategory(category: value!)),
          validator: (value) => state.isCategoryValid
              ? null
              : AppLocalizations.of(context).pleaseChooseCategory,
        );
      },
    );
  }

  Widget voyageField() {
    return BlocBuilder<AddExpenseCubit, AddExpenseState>(
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          value: state.voyageTitle,
          decoration: textFormFieldDecoration(
            context,
            labelText: AppLocalizations.of(context).voyage,
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
              .read<AddExpenseCubit>()
              .changeVoyageTitle(voyageTitle: value!)),
          validator: (value) => state.isVoyageValid
              ? null
              : AppLocalizations.of(context).pleaseChooseVoyage,
        );
      },
    );
  }
}
