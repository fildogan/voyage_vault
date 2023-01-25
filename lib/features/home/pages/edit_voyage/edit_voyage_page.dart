import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel_cost_log/app/injection_container.dart';
import 'package:travel_cost_log/domain/models/voyage_model.dart';
import 'package:travel_cost_log/features/home/pages/edit_voyage/cubit/edit_voyage_cubit.dart';

class EditVoyagePage extends StatefulWidget {
  const EditVoyagePage({super.key, this.voyageModel});

  final VoyageModel? voyageModel;

  @override
  State<EditVoyagePage> createState() => _EditVoyagePageState();
}

class _EditVoyagePageState extends State<EditVoyagePage> {
  String? _voyageTitle;
  double? _voyageBudget;
  DateTime? _voyageStartDate;
  DateTime? _voyageEndDate;
  String? _voyageLocation;
  String? _voyageDescription;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditVoyageCubit>(
      create: (context) => getIt<EditVoyageCubit>()..getVoyageTitleStream(),
      child: BlocListener<EditVoyageCubit, EditVoyageState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).pop(widget.voyageModel);
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
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: const Text('Edit Voyage'),
                actions: [
                  TextButton(
                      onPressed: (() {
                        context.read<EditVoyageCubit>().update(
                              voyageId: widget.voyageModel!.id,
                              title: _voyageTitle ??
                                  widget.voyageModel?.title ??
                                  '',
                              budget: _voyageBudget ??
                                  widget.voyageModel?.budget ??
                                  0.00,
                              startDate: _voyageStartDate ??
                                  widget.voyageModel?.startDate ??
                                  DateTime(2000),
                              endDate: _voyageEndDate ??
                                  widget.voyageModel?.endDate ??
                                  DateTime(2001),
                              location: _voyageLocation ??
                                  widget.voyageModel?.location ??
                                  '',
                              description: _voyageDescription ??
                                  widget.voyageModel?.description ??
                                  '',
                            );
                      }),
                      child: const Text('Save')),
                ],
                // automaticallyImplyLeading: false,
              ),
              body: _EditVoyagePageBody(
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
                startDateFormated: DateFormat.yMd().format(
                  _voyageStartDate ??
                      widget.voyageModel?.startDate ??
                      DateTime(2000),
                ),
                endDateFormated: DateFormat.yMd().format(
                  _voyageEndDate ??
                      widget.voyageModel?.endDate ??
                      DateTime(2000),
                ),
                voyageTitle: _voyageTitle ?? widget.voyageModel?.title ?? '',
                voyageBudget:
                    _voyageBudget ?? widget.voyageModel?.budget ?? 0.00,
                voyageStartDate: _voyageStartDate ??
                    widget.voyageModel?.startDate ??
                    DateTime(2000),
                voyageEndDate: _voyageEndDate ??
                    widget.voyageModel?.endDate ??
                    DateTime(2001),
                voyageTitles: state.voyageTitles,
                voyageLocation:
                    _voyageLocation ?? widget.voyageModel?.location ?? '',
                voyageDescription:
                    _voyageDescription ?? widget.voyageModel?.description ?? '',
              ),
            );
          },
        ),
      ),
    );
  }
}

class _EditVoyagePageBody extends StatelessWidget {
  const _EditVoyagePageBody({
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
          children: [
            TextFormField(
              initialValue: voyageTitle,
              onChanged: onTitleChanged,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Voyage name',
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            TextFormField(
              initialValue: voyageLocation,
              onChanged: onLocationChanged,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Destination',
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            TextFormField(
              initialValue: voyageBudget.toString(),
              textAlign: TextAlign.start,
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
                if (budget != null) {
                  onBudgetChanged(budget);
                }
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
            TextFormField(
              initialValue: voyageDescription,
              onChanged: onDescriptionChanged,
              maxLines: null,
              minLines: 3,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
                labelStyle: TextStyle(),
                alignLabelWithHint: true,
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
