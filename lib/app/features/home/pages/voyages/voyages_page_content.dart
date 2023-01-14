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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(Icons.luggage),
          Expanded(
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
          )),
        ],
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
    return Row(
      children: [Text(voyageModel.title)],
    );
  }
}
