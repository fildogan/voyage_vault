import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_cost_log/app/features/home/pages/voyage_details/cubit/voyage_details_cubit.dart';
import 'package:travel_cost_log/app/repositories/expenses_repository.dart';
import 'package:travel_cost_log/app/repositories/voyages_repository.dart';

class VoyageDetailsPage extends StatelessWidget {
  const VoyageDetailsPage({super.key, required this.voyageID});

  final String voyageID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Voyage details')),
      body: SafeArea(
        child: Column(
          children: [
            BlocProvider(
              create: (context) => VoyageDetailsCubit(
                VoyagesRepository(),
                ExpensesRepository(),
              )..getVoyageWithID(voyageID),
              child: BlocBuilder<VoyageDetailsCubit, VoyageDetailsState>(
                builder: (context, state) {
                  final voyageModel = state.voyageModel;
                  if (voyageModel == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Card(
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(voyageModel.title),
                    ),
                  );
                },
              ),
            ),
            //FIXME two seperate bloc builders and providers?
            BlocProvider(
              create: (context) => VoyageDetailsCubit(
                VoyagesRepository(),
                ExpensesRepository(),
              )..getExpensesStreamByVoyageID(voyageID),
              child: BlocBuilder<VoyageDetailsCubit, VoyageDetailsState>(
                builder: (context, state) {
                  final expenseModels = state.expenses;

                  return Expanded(
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
