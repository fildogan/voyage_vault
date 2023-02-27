import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/app/injection_container.dart';
import 'package:voyage_vault/components/add_edit_app_bar.dart';
import 'package:voyage_vault/components/add_edit_form_body.dart';
import 'package:voyage_vault/components/add_edit_listener.dart';
import 'package:voyage_vault/components/status_switch_case.dart';
import 'package:voyage_vault/components/text_form_field_decoration.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:voyage_vault/domain/models/voyager_model.dart';
import 'package:voyage_vault/features/home/pages/add_expense/cubit/add_expense_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@immutable
class AddExpensePage extends StatelessWidget {
  AddExpensePage({super.key, this.voyageModel});

  final VoyageModel? voyageModel;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddExpenseCubit>(
      create: (context) => getIt<AddExpenseCubit>()..start(voyageModel),
      child: BlocConsumer<AddExpenseCubit, AddExpenseState>(
        listener: (context, state) {
          AddEditListener(
            context: context,
            formStatus: state.formStatus,
            errorMessage: state.errorMessage,
            successMessage: state.successMessage,
          ).listen();
        },
        builder: (context, state) {
          void Function()? saveExpense;
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
                formStatus: state.formStatus,
              ),
              body: _AddExpensePageBody(
                formKey: formKey,
              ));
        },
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
    return BlocBuilder<AddExpenseCubit, AddExpenseState>(
      builder: (context, state) {
        return StatusSwitchCase(
          context: context,
          status: state.status,
          ifCheck: state.voyages.isEmpty,
          ifTrueMessage: 'No voyages found',
          errorMessage: state.errorMessage,
          child: () => AddEditFormBody(
            formKey: formKey,
            children: [
              nameField(),
              priceField(),
              categoryField(),
              voyageField(),
              voyagerField(),
            ],
          ),
        );
      },
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
              context.read<AddExpenseCubit>().changeVoyage(voyage: value!)),
          validator: (value) => state.isVoyageValid
              ? null
              : AppLocalizations.of(context).pleaseChooseVoyage,
        );
      },
    );
  }

  Widget voyagerField() {
    return BlocBuilder<AddExpenseCubit, AddExpenseState>(
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

            onChanged: ((value) =>
                context.read<AddExpenseCubit>().changeVoyager(voyager: value!)),

            // validator: (value) => state.isVoyageValid
            //     ? null
            //     : AppLocalizations.of(context).pleaseChooseVoyage,
          ),
        );
      },
    );
  }
}
