import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/app/injection_container.dart';
import 'package:voyage_vault/components/save_app_bar_button.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:voyage_vault/features/home/pages/add_expense/cubit/add_expense_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddExpensePage extends StatelessWidget {
  AddExpensePage({super.key, this.voyageModel});

  final VoyageModel? voyageModel;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: AutoSizeText(
                  AppLocalizations.of(context).addExpense,
                  maxLines: 1,
                ),
                actions: [_saveButton(context)],
              ),
              body: _AddExpensePageBody(
                formKey: formKey,
              ));
        }),
      ),
    );
  }

  Widget _saveButton(BuildContext context) {
    return BlocBuilder<AddExpenseCubit, AddExpenseState>(
      builder: (context, state) {
        return SaveAppBarButton(
            onPressed: state.formStatus == FormStatus.initial
                ? () {
                    if (formKey.currentState!.validate()) {
                      context.read<AddExpenseCubit>().add();
                    }
                  }
                : null);
      },
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
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              _nameField(),
              _priceField(),
              _categoryField(),
              _voyageField()
            ],
          ),
        ),
      ),
    );
  }

  Widget _voyageField() {
    return BlocBuilder<AddExpenseCubit, AddExpenseState>(
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
              .read<AddExpenseCubit>()
              .changeVoyageTitle(voyageTitle: value!)),
          validator: (value) => state.isVoyageValid
              ? null
              : AppLocalizations.of(context).pleaseChooseVoyage,
        );
      },
    );
  }

  Widget _categoryField() {
    return BlocBuilder<AddExpenseCubit, AddExpenseState>(
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          value: state.category,
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
          onChanged: ((value) =>
              context.read<AddExpenseCubit>().changeCategory(category: value!)),
          validator: (value) => state.isCategoryValid
              ? null
              : AppLocalizations.of(context).pleaseChooseCategory,
        );
      },
    );
  }

  Widget _priceField() {
    return BlocBuilder<AddExpenseCubit, AddExpenseState>(
      builder: (context, state) {
        return TextFormField(
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
            context.read<AddExpenseCubit>().changePrice(price: price ?? 0);
          },
          validator: (value) => state.isPriceValid
              ? null
              : AppLocalizations.of(context).pleaseEnterExpenseAmount,
        );
      },
    );
  }

  Widget _nameField() {
    return BlocBuilder<AddExpenseCubit, AddExpenseState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: AppLocalizations.of(context).expenseName,
            contentPadding: const EdgeInsets.all(10),
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
}
