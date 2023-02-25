import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:voyage_vault/app/injection_container.dart';
import 'package:voyage_vault/domain/models/voyager_model.dart';
import 'package:voyage_vault/features/global_widgets/confirm_delete_alert_dialog.dart';
import 'package:voyage_vault/features/global_widgets/slidable/slidable_action_delete.dart';
import 'package:voyage_vault/features/global_widgets/slidable/slidable_action_edit.dart';
import 'package:voyage_vault/features/home/pages/settings/pages/cubit/voyager_list_cubit.dart';

class VoyagerListPage extends StatelessWidget {
  const VoyagerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<VoyagerListCubit>()..start(),
      child: BlocBuilder<VoyagerListCubit, VoyagerListState>(
        builder: (context, state) {
          List<VoyagerModel> voyagerModels = state.voyagers;
          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
                child: ListView(
              children: [
                for (final voyager in voyagerModels)
                  VoyagerTile(voyager: voyager),
              ],
            )),
          );
        },
      ),
    );
  }
}

class VoyagerTile extends StatelessWidget {
  const VoyagerTile({
    super.key,
    required this.voyager,
  });

  final VoyagerModel voyager;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slidable(
          key: ValueKey(voyager.id),
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            dismissible: DismissiblePane(
              onDismissed: () {
                context.read<VoyagerListCubit>().remove(
                      voyagerId: voyager.id,
                    );
                // .then((value) => context
                //     .read<VoyageDetailsCubit>()
                //     .refreshVoyage(currentVoyageModel.id));
              },
              closeOnCancel: true,
              confirmDismiss: () async {
                bool result = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ConfirmDeleteAlertDialog(
                      title: 'Delete voyager ${voyager.name}?',
                      content:
                          'If you continue, this voyager will be permanently deleted. This action is irreversible.',
                    );
                  },
                );
                return result;
              },
            ),
            children: [
              SlidableActionEdit(
                onPressed: (context) {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             EditExpensePage(
                  //               expenseModel: expenseModel,
                  //               voyageModel:
                  //                   currentVoyageModel,
                  //             )));
                },
              ),
              SlidableActionDelete(
                onPressed: (context) {
                  context.read<VoyagerListCubit>().remove(
                        voyagerId: voyager.id,
                      );
                  // .then((value) => context
                  //     .read<VoyageDetailsCubit>()
                  //     .refreshVoyage(currentVoyageModel.id));
                },
              ),
            ],
          ),
          child: ListTile(
            title: Text(
              voyager.name,
            ),
            trailing: Container(
              color: voyager.color,
              width: 20,
              height: 20,
            ),
          ),
        ),
        const Divider(
          thickness: 3,
        )
      ],
    );
  }
}
