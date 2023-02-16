import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:voyage_vault/app/injection_container.dart';
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
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Text('Create ${AppLocalizations.of(context).voyage}'),
                actions: [
                  TextButton(
                      onPressed: (() {
                        context.read<AddVoyageCubit>().addVoyageAndCheck(
                              title: _voyageTitle,
                              budget: _voyageBudget,
                              startDate: _voyageStartDate,
                              endDate: _voyageEndDate,
                              location: _voyageLocation,
                              description: _voyageDescription,
                            );
                      }),
                      child: Text(AppLocalizations.of(context).save)),
                ],
                // automaticallyImplyLeading: false,
              ),
              body: _AddVoyagePageBody(
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

class _AddVoyagePageBody extends StatelessWidget {
  const _AddVoyagePageBody({
    required this.onTitleChanged,
    required this.onBudgetChanged,
    required this.onStartDateChanged,
    required this.onLocationChanged,
    required this.onDescriptionChanged,
    this.startDateFormated,
    required this.onEndDateChanged,
    this.endDateFormated,
    this.voyageTitle,
    this.voyageBudget,
    this.voyageStartDate,
    this.voyageEndDate,
    required this.voyageTitles,
    this.voyageLocation,
    this.voyageDescription,
  });

  final Function(String?) onTitleChanged;
  final Function(String?) onLocationChanged;
  final Function(String?) onDescriptionChanged;

  final Function(double?) onBudgetChanged;

  final Function(DateTime?) onStartDateChanged;
  final Function(DateTime?) onEndDateChanged;

  final String? startDateFormated;
  final String? endDateFormated;

  final String? voyageTitle;
  final double? voyageBudget;
  final DateTime? voyageStartDate;
  final DateTime? voyageEndDate;
  final String? voyageLocation;
  final String? voyageDescription;

  final List<String> voyageTitles;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: onTitleChanged,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Voyage name',
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            TextField(
              onChanged: onLocationChanged,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: AppLocalizations.of(context).destination,
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
            TextField(
              textAlign: TextAlign.end,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Budget',
                contentPadding: EdgeInsets.all(10),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'^\d*\.?\d{0,2}'),
                ),
              ],
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                final budget = double.tryParse(value);
                onBudgetChanged(budget);
              },
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                      controller:
                          TextEditingController(text: startDateFormated),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.calendar_today),
                        labelText: "Start Date",
                        contentPadding: EdgeInsets.all(10),
                      ),
                      readOnly: true, // when true user cannot edit text
                      onTap: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime.now().add(
                            const Duration(days: 365 * 10),
                          ),
                        );
                        onStartDateChanged(selectedDate);
                      }),
                ),
                const SizedBox(
                  width: 30,
                ),
                Flexible(
                  child: TextField(
                      controller: TextEditingController(text: endDateFormated),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.calendar_today),
                        labelText: "End Date",
                        contentPadding: EdgeInsets.all(10),
                      ),
                      readOnly: true, // when true user cannot edit text
                      onTap: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime.now().add(
                            const Duration(days: 365 * 10),
                          ),
                        );
                        onEndDateChanged(selectedDate);
                      }),
                ),
              ],
            ),
            TextField(
              onChanged: onDescriptionChanged,
              maxLines: null,
              minLines: 3,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: AppLocalizations.of(context).description,
                labelStyle: const TextStyle(),
                alignLabelWithHint: true,
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
