import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:voyage_vault/app/injection_container.dart';
import 'package:voyage_vault/components/add_edit_app_bar.dart';
import 'package:voyage_vault/features/home/pages/add_voyage/add_voyage_page_body.dart';
import 'package:voyage_vault/features/home/pages/add_voyage/cubit/add_voyage_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddVoyagePage extends StatefulWidget {
  const AddVoyagePage({super.key});

  @override
  State<AddVoyagePage> createState() => _AddVoyagePageState();
}

class _AddVoyagePageState extends State<AddVoyagePage> {
  String? _voyageTitle;
  double? _voyageBudget;
  DateTime? _voyageStartDate;
  DateTime? _voyageEndDate;
  String? _voyageLocation;
  String? _voyageDescription;
  late void Function() saveVoyage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddVoyageCubit>(
      create: (context) => getIt<AddVoyageCubit>()..getVoyageTitleStream(),
      child: BlocListener<AddVoyageCubit, AddVoyageState>(
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
        child: BlocBuilder<AddVoyageCubit, AddVoyageState>(
          builder: (context, state) {
            saveVoyage = (() {
              context.read<AddVoyageCubit>().addVoyageAndCheck(
                    title: _voyageTitle,
                    budget: _voyageBudget,
                    startDate: _voyageStartDate,
                    endDate: _voyageEndDate,
                    location: _voyageLocation,
                    description: _voyageDescription,
                  );
            });
            return Scaffold(
              appBar: AddEditAppBar(
                title: AppLocalizations.of(context).addVoyage,
                saveAction: saveVoyage,
                appBar: AppBar(),
              ),
              body: AddVoyagePageBody(
                onTitleChanged: (newValue) =>
                    setState(() => _voyageTitle = newValue),
                onBudgetChanged: (newValue) =>
                    setState(() => _voyageBudget = newValue),
                onStartDateChanged: (newValue) =>
                    setState(() => _voyageStartDate = newValue),
                onEndDateChanged: (newValue) =>
                    setState(() => _voyageEndDate = newValue),
                onLocationChanged: (newValue) =>
                    setState(() => _voyageLocation = newValue),
                onDescriptionChanged: (newValue) =>
                    setState(() => _voyageDescription = newValue),
                startDateFormated: _voyageStartDate == null
                    ? null
                    : DateFormat.yMd().format(_voyageStartDate!),
                endDateFormated: _voyageEndDate == null
                    ? null
                    : DateFormat.yMd().format(_voyageEndDate!),
                voyageTitle: _voyageTitle,
                voyageBudget: _voyageBudget,
                voyageStartDate: _voyageStartDate,
                voyageEndDate: _voyageEndDate,
                voyageTitles: state.voyageTitles,
                voyageLocation: _voyageLocation,
                voyageDescription: _voyageDescription,
              ),
            );
          },
        ),
      ),
    );
  }
}
