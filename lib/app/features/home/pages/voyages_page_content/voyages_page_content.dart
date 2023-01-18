import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_cost_log/app/features/home/pages/voyage_details/voyage_details_page.dart';
import 'package:travel_cost_log/app/features/home/pages/voyages_page_content/cubit/voyages_cubit.dart';
import 'package:travel_cost_log/app/features/home/pages/voyages_page_content/widgets/alert_dialog.dart';
import 'package:travel_cost_log/app/models/voyage_model.dart';
import 'package:travel_cost_log/app/repositories/voyages_repository.dart';

class VoyagesPageContent extends StatelessWidget {
  const VoyagesPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => VoyagesCubit(VoyagesRepository())..start(),
        child: BlocBuilder<VoyagesCubit, VoyagesState>(
          builder: (context, state) {
            final voyageModels = state.voyages;
            return ListView(
              children: [
                for (final voyageModel in voyageModels)
                  Dismissible(
                    key: ValueKey(voyageModel.id),
                    onDismissed: (direction) => context
                        .read<VoyagesCubit>()
                        .remove(documentID: voyageModel.id),
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
            builder: (context) => VoyageDetailsPage(voyageID: voyageModel.id),
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
                children: const [
                  Text(
                    '€ 500',
                    style: TextStyle(fontSize: 20),
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
