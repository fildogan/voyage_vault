import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/app/injection_container.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:voyage_vault/features/home/pages/voyage_details/voyage_details_page.dart';
import 'package:voyage_vault/features/home/pages/voyages_page_content/cubit/voyages_cubit.dart';
import 'package:voyage_vault/features/home/pages/voyages_page_content/widgets/alert_dialog.dart';

class VoyagesPageContent extends StatelessWidget {
  const VoyagesPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<VoyagesCubit>(
        create: (context) => getIt<VoyagesCubit>()..start(),
        child: BlocBuilder<VoyagesCubit, VoyagesState>(
          builder: (context, state) {
            switch (state.status) {
              case Status.initial:
                return const Center(
                  child: Text('Initial state'),
                );
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.success:
                if (state.voyages.isEmpty) {
                  return const Center(
                    child: Text('No voyages found'),
                  );
                }
                final voyageModels = state.voyages;
                return ListView(
                  children: [
                    for (final voyageModel in voyageModels)
                      Dismissible(
                        key: ValueKey(voyageModel.id),
                        onDismissed: (direction) {
                          context.read<VoyagesCubit>().remove(
                                voyageId: voyageModel.id,
                              );
                          context.read<VoyagesCubit>().removeExpensesByVoyageId(
                                voyageId: voyageModel.id,
                              );
                        },
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          color: Colors.red,
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        confirmDismiss: (direction) {
                          return showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return RemoveVoyageAlertDialog(
                                voyageModel: voyageModel,
                              );
                            },
                          );
                        },
                        child: _ListViewItem(voyageModel: voyageModel),
                      )
                  ],
                );
              case Status.error:
                return Center(
                  child: Text(
                    state.errorMessage ?? 'Unknown error',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

class _ListViewItem extends StatelessWidget {
  const _ListViewItem({
    required this.voyageModel,
  });

  final VoyageModel voyageModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VoyageDetailsPage(voyageModel: voyageModel),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(top: 10) +
            const EdgeInsets.symmetric(horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    voyageModel.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  voyageModel.location == ''
                      ? const SizedBox.shrink()
                      : Text(
                          voyageModel.location,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'from: ${voyageModel.startDateFormated()} to: ${voyageModel.endDateFormated()}',
                    style: const TextStyle(fontSize: 10),
                  ),
                  Text(
                    '${voyageModel.duration()} days',
                    style: const TextStyle(fontSize: 10),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    '€ ${voyageModel.budget.toStringAsFixed(0)}',
                    // style: const TextStyle(fontSize: 20),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
