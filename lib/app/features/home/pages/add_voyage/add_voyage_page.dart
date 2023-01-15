import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel_cost_log/app/features/home/pages/add_voyage/cubit/add_voyage_cubit.dart';
import 'package:travel_cost_log/app/repositories/voyages_repository.dart';

class AddVoyagePage extends StatefulWidget {
  const AddVoyagePage({super.key});

  @override
  State<AddVoyagePage> createState() => _AddVoyagePageState();
}

class _AddVoyagePageState extends State<AddVoyagePage> {
  String? _voyageTitle;
  DateTime? _voyageStartDate;
  DateTime? _voyageEndDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AddVoyageCubit(VoyagesRepository()),
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
                voyageStartDate: _voyageStartDate,
                voyageEndDate: _voyageEndDate,
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
    required this.onStartDateChanged,
    this.startDateFormated,
    required this.onEndDateChanged,
    this.endDateFormated,
    this.voyageTitle,
    this.voyageStartDate,
    this.voyageEndDate,
  });

  final Function(String?) onTitleChanged;

  final Function(DateTime?) onStartDateChanged;
  final Function(DateTime?) onEndDateChanged;

  final String? startDateFormated;
  final String? endDateFormated;

  final String? voyageTitle;
  final DateTime? voyageStartDate;
  final DateTime? voyageEndDate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: TextField(
                onChanged: onTitleChanged,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
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
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(
                    const Duration(days: 365 * 10),
                  ),
                );
                onEndDateChanged(selectedDate);
              },
              child: Text(endDateFormated ?? 'Choose voyage end date'),
            ),
            ElevatedButton(
              onPressed: voyageTitle == null ||
                      voyageStartDate == null ||
                      voyageEndDate == null
                  ? () => Navigator.of(context).pop()
                  : () => context
                      .read<AddVoyageCubit>()
                      .add(voyageTitle!, voyageStartDate!, voyageEndDate!),
              child: const Text('Add Voyage'),
            )
          ],
        ),
      ),
    );
  }
}
