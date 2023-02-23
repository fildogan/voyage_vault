import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/app/injection_container.dart';
import 'package:voyage_vault/components/save_app_bar_button.dart';
import 'package:voyage_vault/domain/models/expense_model.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:voyage_vault/features/home/pages/edit_expense/cubit/edit_expense_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:voyage_vault/features/home/pages/edit_expense/edit_expense_page_body.dart';

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
                title: Text(
                    '${AppLocalizations.of(context).edit} ${AppLocalizations.of(context).expense}'),
                actions: [
                  _saveButton(context),
                ],
                // automaticallyImplyLeading: false,
              ),
              body: EditExpensePageBody(
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
        return SaveAppBarButton(
          onPressed: state.formStatus == FormStatus.submitting
              ? null
              : () {
                  if (formKey.currentState!.validate()) {
                    context.read<EditExpenseCubit>().update();
                  }
                },
        );
      },
    );
  }
}
