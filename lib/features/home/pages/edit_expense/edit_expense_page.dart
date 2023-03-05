import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage_vault/app/injection_container.dart';
import 'package:voyage_vault/components/add_edit_app_bar.dart';
import 'package:voyage_vault/components/add_edit_listener.dart';
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
      child: BlocConsumer<EditExpenseCubit, EditExpenseState>(
        listener: (context, state) {
          AddEditListener(
            context: context,
            formStatus: state.formStatus,
            errorMessage: state.errorMessage,
            successMessage: state.successMessage,
          ).listen();
        },
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
    );
  }
}
