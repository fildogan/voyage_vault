import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_cost_log/app/features/home/pages/voyage_details/cubit/voyage_details_cubit.dart';
import 'package:travel_cost_log/app/injection_container.dart';
import 'package:travel_cost_log/app/models/voyage_model.dart';
import 'package:travel_cost_log/app/repositories/expenses_repository.dart';

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

          return Scaffold(
            appBar: AppBar(title: const Text('Voyage details')),
            body: SafeArea(
              child: Column(
                children: [
                  Card(
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(voyageModel.title),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        if (expenseModels.isEmpty)
                          const Center(child: Text('No expenses added yet.'))
                        else
                          for (final expenseModel in expenseModels)
                            Dismissible(
                              key: ValueKey(expenseModel.id),
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
