import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage_vault/app/injection_container.dart';
import 'package:voyage_vault/components/add_edit_app_bar.dart';
import 'package:voyage_vault/components/add_edit_listener.dart';
import 'package:voyage_vault/features/home/pages/add_voyage/add_voyage_page_body.dart';
import 'package:voyage_vault/features/home/pages/add_voyage/cubit/add_voyage_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@immutable
class AddVoyagePage extends StatefulWidget {
  const AddVoyagePage({super.key});

  @override
  State<AddVoyagePage> createState() => _AddVoyagePageState();
}

class _AddVoyagePageState extends State<AddVoyagePage> {
  late void Function() saveVoyage;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddVoyageCubit>(
      create: (context) => getIt<AddVoyageCubit>()..start(),
      child: BlocConsumer<AddVoyageCubit, AddVoyageState>(
        listener: (context, state) {
          AddEditListener(
            context: context,
            formStatus: state.formStatus,
            errorMessage: state.errorMessage,
            successMessage: state.successMessage,
          ).listen();
        },
        builder: (context, state) {
          saveVoyage = (() {
            if (formKey.currentState!.validate()) {
              context.read<AddVoyageCubit>().add();
            }
          });
          return Scaffold(
            appBar: AddEditAppBar(
              title: AppLocalizations.of(context).addVoyage,
              saveAction: saveVoyage,
              appBar: AppBar(),
            ),
            body: AddVoyagePageBody(
              formKey: formKey,
              voyageTitles: state.voyageTitles,
            ),
          );
        },
      ),
    );
  }
}
