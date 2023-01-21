import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_cost_log/app/injection_container.dart';
import 'package:travel_cost_log/domain/models/voyage_model.dart';
import 'package:travel_cost_log/features/home/pages/add_expense/add_expense_page.dart';
import 'package:travel_cost_log/features/home/pages/voyage_details/cubit/voyage_details_cubit.dart';

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
          // Get sum of all expenses for given voyage
          final double expenseSum =
              expenseModels.fold(0, (prev, element) => prev + element.price);
          return Scaffold(
            appBar: AppBar(title: Text(voyageModel.title)),
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddExpensePage(
                    voyageModel: voyageModel,
                  ),
                  fullscreenDialog: true,
                ),
              ),
              child: const Icon(Icons.add),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Text('Voyage budget: ${voyageModel.budget}'),
                  Text('Total expenses spent: € ${expenseSum.toString()}'),
                  Expanded(
                    child: ListView(
                      children: [
                        if (expenseModels.isEmpty)
                          const Center(child: Text('No expenses added yet.'))
                        else
                          for (final expenseModel in expenseModels)
                            Dismissible(
                              key: ValueKey(expenseModel.id),
                              onDismissed: (direction) {
                                context.read<VoyageDetailsCubit>().remove(
                                      expenseId: expenseModel.id,
                                    );
                              },
                              confirmDismiss: (direction) {
                                return showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Remove expense?'),
                                      content:
                                          Text('Voyage: ${expenseModel.name}'),
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
                              child: Card(
                                child: Column(
                                  children: [
                                    Text(expenseModel.name),
                                    Text(expenseModel.price.toString()),
                                    Text(expenseModel.category),
                                  ],
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
