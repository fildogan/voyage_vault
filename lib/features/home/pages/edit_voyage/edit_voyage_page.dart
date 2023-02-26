import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage_vault/app/injection_container.dart';
import 'package:voyage_vault/components/add_edit_app_bar.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';
import 'package:voyage_vault/features/home/pages/edit_voyage/cubit/edit_voyage_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:voyage_vault/features/home/pages/edit_voyage/edit_voyage_page_body.dart';

@immutable
class EditVoyagePage extends StatelessWidget {
  const EditVoyagePage({super.key, required this.voyageModel});

  final VoyageModel voyageModel;

  @override
  Widget build(BuildContext context) {
    late void Function() saveVoyage;

    final formKey = GlobalKey<FormState>();

    return BlocProvider<EditVoyageCubit>(
      create: (context) =>
          getIt<EditVoyageCubit>()..start(voyageModel: voyageModel),
      child: BlocListener<EditVoyageCubit, EditVoyageState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).pop();
          }
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage ?? 'Unknown error',
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (state.successMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Icon(Icons.done),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      state.successMessage ?? 'Success',
                    ),
                  ],
                ),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        child: BlocBuilder<EditVoyageCubit, EditVoyageState>(
          builder: (context, state) {
            saveVoyage = (() {
              if (formKey.currentState!.validate()) {
                context.read<EditVoyageCubit>().update();
              }
            });
            return Scaffold(
              appBar: AddEditAppBar(
                title: AppLocalizations.of(context).editVoyage,
                saveAction: saveVoyage,
                appBar: AppBar(),
              ),
              body: EditVoyagePageBody(
                formKey: formKey,
                voyageTitles: state.voyageTitles,
              ),
            );
          },
        ),
      ),
    );
  }
}
