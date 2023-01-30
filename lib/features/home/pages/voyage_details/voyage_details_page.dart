import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:travel_cost_log/app/injection_container.dart';
import 'package:travel_cost_log/domain/models/voyage_model.dart';
import 'package:travel_cost_log/features/home/pages/add_expense/add_expense_page.dart';
import 'package:travel_cost_log/features/home/pages/edit_expense/edit_expense_page.dart';
import 'package:travel_cost_log/features/home/pages/edit_voyage/edit_voyage_page.dart';
import 'package:travel_cost_log/features/home/pages/voyage_details/cubit/voyage_details_cubit.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
              state.voyageModel ?? voyageModel;
          // Get sum of all expenses for given voyage
          final double expenseSum =
              expenseModels.fold(0, (prev, element) => prev + element.price);
          final double percentBudgetSpent =
              (expenseSum / (currentVoyageModel.budget));
          final String percentBudgetSpentFormatted =
              (percentBudgetSpent * 100).toStringAsFixed(2);
          return Scaffold(
            appBar: AppBar(
              title: Text(currentVoyageModel.title),
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
                    child: const Text('Edit'))
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
            body: SafeArea(
              child: Column(
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
                                'Description: ${currentVoyageModel.description}'),
                        Text('Voyage budget: ${currentVoyageModel.budget}'),
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
                            InkWell(
                              // onTap: () {
                              //   Navigator.of(context)
                              //       .push(MaterialPageRoute(
                              //           builder: (context) => EditExpensePage(
                              //               voyageModel: voyageModel)))
                              //       .then((value) => context
                              //           .read<VoyageDetailsCubit>()
                              //           .refreshVoyage(currentVoyageModel.id));
                              // },
                              child: Slidable(
                                key: ValueKey(expenseModel.id),
                                endActionPane: ActionPane(
                                  // A motion is a widget used to control how the pane animates.
                                  motion: const StretchMotion(),

                                  // A pane can dismiss the Slidable.
                                  dismissible: DismissiblePane(
                                    onDismissed: () {
                                      context
                                          .read<VoyageDetailsCubit>()
                                          .remove(
                                            expenseId: expenseModel.id,
                                          )
                                          .then((value) => context
                                              .read<VoyageDetailsCubit>()
                                              .refreshVoyage(
                                                  currentVoyageModel.id));
                                    },
                                    closeOnCancel: true,
                                    confirmDismiss: () async {
                                      bool result = await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                              'Delete expense ${expenseModel.name}?',
                                            ),
                                            content: const Text(
                                              'If you continue, this expense will be permanently deleted. This action is irreversible.',
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.of(context)
                                                        .pop(true),
                                                child: const Text('Yes'),
                                              ),
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.of(context)
                                                        .pop(false),
                                                child: const Text('No'),
                                              ),
                                            ],
                                          );
                                        },
                                      );

                                      return result;
                                    },
                                  ),

                                  // All actions are defined in the children parameter.
                                  children: [
                                    // A SlidableAction can have an icon and/or a label.

                                    SlidableAction(
                                      onPressed: (context) {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    EditExpensePage(
                                                        expenseModel:
                                                            expenseModel)))
                                            .then((value) => context
                                                .read<VoyageDetailsCubit>()
                                                .refreshVoyage(
                                                    currentVoyageModel.id));
                                      },
                                      backgroundColor: const Color(0xFF21B7CA),
                                      foregroundColor: Colors.white,
                                      icon: Icons.edit,
                                      label: 'Edit',
                                    ),
                                    SlidableAction(
                                      onPressed: (context) {
                                        context
                                            .read<VoyageDetailsCubit>()
                                            .remove(
                                              expenseId: expenseModel.id,
                                            )
                                            .then((value) => context
                                                .read<VoyageDetailsCubit>()
                                                .refreshVoyage(
                                                    currentVoyageModel.id));
                                      },
                                      backgroundColor: const Color(0xFFFE4A49),
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                    ),
                                  ],
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: SizedBox(
                                    width: double.infinity,
                                    // color: Colors.black12,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  'Expense: ${expenseModel.name}'),
                                              Text(
                                                  'Amount: ${expenseModel.price.toString()}'),
                                              Text(
                                                  'Category: ${expenseModel.category}'),
                                              Text(
                                                  'Date Added: ${expenseModel.dateAddedFormated()}'),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.black38),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
}
