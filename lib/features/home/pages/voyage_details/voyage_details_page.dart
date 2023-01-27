import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_cost_log/app/injection_container.dart';
import 'package:travel_cost_log/domain/models/voyage_model.dart';
import 'package:travel_cost_log/features/home/pages/add_expense/add_expense_page.dart';
import 'package:travel_cost_log/features/home/pages/edit_voyage/edit_voyage_page.dart';
import 'package:travel_cost_log/features/home/pages/voyage_details/cubit/voyage_details_cubit.dart';
import 'package:percent_indicator/percent_indicator.dart';

class VoyageDetailsPage extends StatelessWidget {
  const VoyageDetailsPage({super.key, required this.voyageModel});

  final VoyageModel voyageModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<VoyageDetailsCubit>()
        ..getExpensesStreamByVoyageId(voyageModel.id),
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
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            EditVoyagePage(voyageModel: currentVoyageModel),
                      ));
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
                children: [
                  currentVoyageModel.description == ''
                      ? const SizedBox.shrink()
                      : Text('Description: ${currentVoyageModel.description}'),
                  Text('Voyage budget: ${currentVoyageModel.budget}'),
                  Text('Total expenses spent: € ${expenseSum.toString()}'),
                  Text('Percentage spent: $percentBudgetSpentFormatted %'),
                  percentBudgetSpent > 1.0
                      ? Text(
                          'You have spent €${(expenseSum - currentVoyageModel.budget).toStringAsFixed(2)} over the budget')
                      : const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width - 50,
                      // animation: true,
                      lineHeight: 20.0,
                      // animationDuration: 2000,
                      percent:
                          percentBudgetSpent > 1.0 ? 1.0 : percentBudgetSpent,
                      center: Text("$percentBudgetSpentFormatted%"),
                      progressColor: percentBudgetSpent > 1.0
                          ? Colors.red
                          : Colors.green.shade800,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.black),
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
                            Dismissible(
                              key: ValueKey(expenseModel.id),
                              onDismissed: (direction) {
                                context.read<VoyageDetailsCubit>().remove(
                                      expenseId: expenseModel.id,
                                    );
                              },
                              direction: DismissDirection.endToStart,
                              background: Container(
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 20),
                                color: Colors.red,
                                child: const Icon(Icons.delete,
                                    color: Colors.white),
                              ),
                              confirmDismiss: (direction) {
                                return showDialog(
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
                                              Navigator.of(context).pop(true),
                                          child: const Text('Yes'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: const Text('No'),
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                              child: SizedBox(
                                width: double.infinity,
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.black12,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Text(expenseModel.name),
                                            Text(expenseModel.price.toString()),
                                            Text(expenseModel.category),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom:
                                                BorderSide(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
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
