import 'package:flutter/material.dart';
import 'package:travel_cost_log/app/features/home/pages/voyages/cubit/voyages_cubit.dart';
import 'package:travel_cost_log/app/models/voyage_model.dart';
import 'package:travel_cost_log/app/repositories/voyages_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                      child: _ListViewItem(voyageModel: voyageModel))
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
    Key? key,
    required this.voyageModel,
  }) : super(key: key);

  final VoyageModel voyageModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown.shade700,
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
                      fontWeight: FontWeight.bold, fontSize: 15),
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
              mainAxisAlignment: MainAxisAlignment.start,
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
    );
  }
}
