import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/app/injection_container.dart';
import 'package:voyage_vault/components/add_edit_app_bar.dart';
import 'package:voyage_vault/domain/models/expense_model.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:voyage_vault/domain/models/voyager_model.dart';
import 'package:voyage_vault/features/home/pages/edit_expense/cubit/edit_expense_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:voyage_vault/features/home/pages/edit_expense/edit_expense_page_body.dart';

@immutable
class EditExpensePage extends StatelessWidget {
  EditExpensePage(
      {super.key,
      required this.expenseModel,
      required this.voyageModel,
      this.voyagerModel});

  final ExpenseModel expenseModel;
  final VoyageModel voyageModel;
  final VoyagerModel? voyagerModel;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    late void Function() saveExpense;

    return BlocProvider<EditExpenseCubit>(
      create: (context) => getIt<EditExpenseCubit>()
        ..start(
            expenseModel: expenseModel,
            voyageModel: voyageModel,
            voyagerModel: voyagerModel),
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
            saveExpense = (() {
              if (formKey.currentState!.validate()) {
                context.read<EditExpenseCubit>().update();
              }
            });
            return Scaffold(
              appBar: AddEditAppBar(
                saveAction: saveExpense,
                appBar: AppBar(),
                title: AppLocalizations.of(context).editExpense,
                formStatus: state.formStatus,
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
}
