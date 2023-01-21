import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel_cost_log/app/injection_container.dart';
import 'package:travel_cost_log/features/home/pages/add_voyage/cubit/add_voyage_cubit.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a voyage'),
      ),
      body: BlocProvider<AddVoyageCubit>(
        create: (context) => getIt<AddVoyageCubit>()..getVoyageTitleStream(),
        child: BlocListener<AddVoyageCubit, AddVoyageState>(
          listener: (context, state) {
            if (state.saved) {
              Navigator.of(context).pop();
            }
            if (state.errorMessage.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.errorMessage,
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: BlocBuilder<AddVoyageCubit, AddVoyageState>(
            builder: (context, state) {
              return _AddVoyagePageBody(
                onTitleChanged: (newValue) =>
                    setState(() => _voyageTitle = newValue),
                onBudgetChanged: (newValue) =>
                    setState(() => _voyageBudget = newValue),
                onStartDateChanged: (newValue) =>
                    setState(() => _voyageStartDate = newValue),
                onEndDateChanged: (newValue) =>
                    setState(() => _voyageEndDate = newValue),
                startDateFormated: _voyageStartDate == null
                    ? null
                    : 'Selected start date: ${_voyageStartDate == null ? null : DateFormat.yMd().format(_voyageStartDate!)}',
                endDateFormated: _voyageEndDate == null
                    ? null
                    : 'Selected end date: ${_voyageEndDate == null ? null : DateFormat.yMd().format(_voyageEndDate!)}',
                voyageTitle: _voyageTitle,
                voyageBudget: _voyageBudget,
                voyageStartDate: _voyageStartDate,
                voyageEndDate: _voyageEndDate,
                voyageTitles: state.voyageTitles,
              );
            },
          ),
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
    this.startDateFormated,
    required this.onEndDateChanged,
    this.endDateFormated,
    this.voyageTitle,
    this.voyageBudget,
    this.voyageStartDate,
    this.voyageEndDate,
    required this.voyageTitles,
  });

  final Function(String?) onTitleChanged;

  final Function(double?) onBudgetChanged;

  final Function(DateTime?) onStartDateChanged;
  final Function(DateTime?) onEndDateChanged;

  final String? startDateFormated;
  final String? endDateFormated;

  final String? voyageTitle;
  final double? voyageBudget;
  final DateTime? voyageStartDate;
  final DateTime? voyageEndDate;

  final List<String> voyageTitles;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Text('Title: '),
                SizedBox(
                  width: 200,
                  child: TextField(
                    onChanged: onTitleChanged,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Budget: '),
                SizedBox(
                  width: 200,
                  child: TextField(
                    textAlign: TextAlign.end,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^\d*\.?\d{0,2}'),
                      ),
                    ],
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      final budget = double.tryParse(value);
                      if (budget != null) {
                        onBudgetChanged(budget);
                      }
                    },
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now().add(
                    const Duration(days: 365 * 10),
                  ),
                );
                onStartDateChanged(selectedDate);
              },
              child: Text(startDateFormated ?? 'Choose voyage start date'),
            ),
            ElevatedButton(
              onPressed: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now().add(
                    const Duration(days: 365 * 10),
                  ),
                );
                onEndDateChanged(selectedDate);
              },
              child: Text(endDateFormated ?? 'Choose voyage end date'),
            ),
            ElevatedButton(
              onPressed: () {
                if (voyageTitle == null ||
                    voyageBudget == null ||
                    voyageStartDate == null ||
                    voyageEndDate == null) {
                  context
                      .read<AddVoyageCubit>()
                      .error('Please fill all fields');
                } else if (voyageEndDate!.isBefore(voyageStartDate!)) {
                  context
                      .read<AddVoyageCubit>()
                      .error('Voyage start date should be before end date');
                  //FIXME fix check, does voyage exist in collection
                } else if (voyageTitles
                    .map((i) => i.toLowerCase())
                    .contains(voyageTitle!.toLowerCase())) {
                  context
                      .read<AddVoyageCubit>()
                      .error('Voyage title already exists');
                } else {
                  context.read<AddVoyageCubit>().add(
                        voyageTitle!,
                        voyageBudget!,
                        voyageStartDate!,
                        voyageEndDate!,
                      );
                }
              },
              child: const Text('Add Voyage'),
            )
          ],
        ),
      ),
    );
  }
}