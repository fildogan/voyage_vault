import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:voyage_vault/app/injection_container.dart';
import 'package:voyage_vault/components/status_switch_case.dart';
import 'package:voyage_vault/domain/models/expense_model.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:voyage_vault/domain/models/voyager_model.dart';
import 'package:voyage_vault/features/global_widgets/confirm_delete_alert_dialog.dart';
import 'package:voyage_vault/features/global_widgets/slidable/slidable_action_delete.dart';
import 'package:voyage_vault/features/global_widgets/slidable/slidable_action_edit.dart';
import 'package:voyage_vault/features/home/pages/add_expense/add_expense_page.dart';
import 'package:voyage_vault/features/home/pages/edit_expense/edit_expense_page.dart';
import 'package:voyage_vault/features/home/pages/edit_voyage/edit_voyage_page.dart';
import 'package:voyage_vault/features/home/pages/voyage_details/cubit/voyage_details_cubit.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@immutable
class VoyageDetailsPage extends StatelessWidget {
  const VoyageDetailsPage({super.key, required this.voyageModel});

  final VoyageModel voyageModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<VoyageDetailsCubit>()..refreshVoyage(voyageModel.id),
      child: BlocBuilder<VoyageDetailsCubit, VoyageDetailsState>(
        builder: (context, state) {
          final expenseModels = state.expenses;
          final VoyageModel currentVoyageModel =
              state.voyageModel ?? voyageModel.copyWith(title: 'dupa');
          final voyagers = state.voyagers;
          // Get sum of all expenses for given voyage
          final double expenseSum =
              expenseModels.fold(0, (prev, element) => prev + element.price);
          final double percentBudgetSpent =
              (expenseSum / (currentVoyageModel.budget));
          final String percentBudgetSpentFormatted =
              (percentBudgetSpent * 100).toStringAsFixed(2);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                currentVoyageModel.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              actions: [
                TextButton(
                    onPressed: (() {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                            builder: (context) =>
                                EditVoyagePage(voyageModel: currentVoyageModel),
                          ))
                          .then((value) => context
                              .read<VoyageDetailsCubit>()
                              .refreshVoyage(currentVoyageModel.id));
                    }),
                    child: Text(AppLocalizations.of(context).edit))
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddExpensePage(
                    voyageModel: currentVoyageModel,
                  ),
                  fullscreenDialog: true,
                ),
              ),
              child: const Icon(Icons.add),
            ),
            body: StatusSwitchCase(
              context: context,
              status: state.status,
              // ifCheck: state.expenses.isEmpty,
              // ifTrueMessage: 'No expenses found',
              errorMessage: state.errorMessage,
              child: () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        currentVoyageModel.description == ''
                            ? const SizedBox.shrink()
                            : Text(
                                '${AppLocalizations.of(context).description}: ${currentVoyageModel.description}'),
                        Text(
                            '${AppLocalizations.of(context).voyageBudget}: ${currentVoyageModel.budget}'),
                        Text(
                            'Total expenses spent: € ${expenseSum.toString()}'),
                        Text(
                            'Percentage spent: $percentBudgetSpentFormatted %'),
                        percentBudgetSpent > 1.0
                            ? Text(
                                'You have spent €${(expenseSum - currentVoyageModel.budget).toStringAsFixed(2)} over the budget')
                            : const SizedBox(),
                        LinearPercentIndicator(
                          padding: const EdgeInsets.all(0),
                          width: MediaQuery.of(context).size.width - 30,
                          // animation: true,
                          lineHeight: 20.0,
                          // animationDuration: 2000,
                          percent: percentBudgetSpent > 1.0
                              ? 1.0
                              : percentBudgetSpent,
                          center: Text("$percentBudgetSpentFormatted%"),
                          progressColor: percentBudgetSpent > 1.0
                              ? Colors.red
                              : Colors.green.shade800,
                          backgroundColor: Colors.transparent,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            state.unhiddenVoyagers
                                ? Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        for (final voyager in voyagers)
                                          Row(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment
                                            //         .spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.person,
                                                color: voyager.color,
                                              ),
                                              Text(voyager.name),
                                              Spacer(),
                                              Text(getExpensesTotalForVoyager(
                                                      voyager, expenseModels)
                                                  .toString())
                                            ],
                                          ),
                                      ],
                                    ),
                                  )
                                : Expanded(
                                    child: Row(children: [
                                      Text(
                                          '${AppLocalizations.of(context).voyagers}: '),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              for (final voyager in voyagers)
                                                Row(
                                                  children: [
                                                    Text(voyager.name),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8),
                                                      child: Container(
                                                        width: 10,
                                                        height: 10,
                                                        color: voyager.color,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                            InkWell(
                              onTap: () => context
                                  .read<VoyageDetailsCubit>()
                                  .showVoyagers(),
                              child: Icon(state.unhiddenVoyagers
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_right),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.black38),
                              ),
                            ),
                          ),
                        ),
                        if (expenseModels.isEmpty)
                          Center(
                              child: Column(
                            children: const [
                              SizedBox(
                                height: 20,
                              ),
                              Text('No expenses added yet.'),
                            ],
                          ))
                        else
                          for (final expenseModel in expenseModels)
                            expenseModelSlidable(expenseModel, context,
                                state.voyagers, currentVoyageModel),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget expenseModelSlidable(ExpenseModel expenseModel, BuildContext context,
      List<VoyagerModel> voyagers, VoyageModel currentVoyageModel) {
    final voyager = getVoyagerById(expenseModel.voyagerId, voyagers);

    return InkWell(
      onTap: () {
        print(voyager);
        print(expenseModel.voyagerId);
      },
      child: Slidable(
        key: ValueKey(expenseModel.id),
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          dismissible: DismissiblePane(
            onDismissed: () {
              context
                  .read<VoyageDetailsCubit>()
                  .remove(
                    expenseId: expenseModel.id,
                  )
                  .then((value) => context
                      .read<VoyageDetailsCubit>()
                      .refreshVoyage(currentVoyageModel.id));
            },
            closeOnCancel: true,
            confirmDismiss: () async {
              bool result = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ConfirmDeleteAlertDialog(
                    title: 'Delete expense ${expenseModel.name}?',
                    content:
                        'If you continue, this expense will be permanently deleted. This action is irreversible.',
                  );
                },
              );
              return result;
            },
          ),
          children: [
            SlidableActionEdit(
              onPressed: (context) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditExpensePage(
                          expenseModel: expenseModel,
                          voyageModel: currentVoyageModel,
                          voyagerModel: voyager,
                        )));
              },
            ),
            SlidableActionDelete(
              onPressed: (context) {
                context
                    .read<VoyageDetailsCubit>()
                    .remove(
                      expenseId: expenseModel.id,
                    )
                    .then((value) => context
                        .read<VoyageDetailsCubit>()
                        .refreshVoyage(currentVoyageModel.id));
              },
            ),
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          child: SizedBox(
            width: double.infinity,
            // color: Colors.black12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '${AppLocalizations.of(context).expense}: ${expenseModel.name}'),
                      Text(
                          '${AppLocalizations.of(context).amount}: ${expenseModel.price.toString()}'),
                      Text(
                          '${AppLocalizations.of(context).category}: ${expenseModel.category}'),
                      Text(
                          '${AppLocalizations.of(context).dateAdded}: ${expenseModel.dateAddedFormated()}'),
                      if (voyager != null)
                        Row(
                          children: [
                            Text(
                                '${AppLocalizations.of(context).voyager}: ${voyager.name}'),
                            Icon(
                              Icons.person,
                              color: voyager.color,
                            )
                          ],
                        )
                      else
                        Row(
                          children: [
                            Text(
                                //TODO: add unassigned translation
                                '${AppLocalizations.of(context).voyager}: Unassigned'),
                            const Icon(
                              Icons.person_off,
                            )
                          ],
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black38),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  VoyagerModel? getVoyagerById(String? id, List<VoyagerModel>? voyagers) {
    if (id == null || voyagers == null || voyagers.isEmpty) {
      return null;
    }
    try {
      return voyagers.firstWhere((voyager) => voyager.id == id);
    } catch (e) {
      // Handle the case where no matching voyager is found
      return null;
    }
  }
}

double getExpensesTotalForVoyager(
    VoyagerModel voyager, List<ExpenseModel> expenses) {
  double total = 0;
  for (ExpenseModel expense in expenses) {
    if (expense.voyagerId == voyager.id) {
      total += expense.price;
    }
  }
  return total;
}
