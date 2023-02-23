import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:voyage_vault/features/home/pages/edit_voyage/cubit/edit_voyage_cubit.dart';

class EditVoyagePageBody extends StatelessWidget {
  const EditVoyagePageBody({
    // required this.onBudgetChanged,
    required this.onStartDateChanged,
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
              onChanged: ((value) {
                context.read<EditVoyageCubit>().changeTitleValue(value);
              }),
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: AppLocalizations.of(context).voyageName,
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
            TextFormField(
              initialValue: voyageLocation,
              onChanged: ((value) {
                context.read<EditVoyageCubit>().changeLocationValue(value);
              }),
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: AppLocalizations.of(context).destination,
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
            TextFormField(
              initialValue: voyageBudget.toString(),
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: AppLocalizations.of(context).budget,
                contentPadding: const EdgeInsets.all(10),
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

                context.read<EditVoyageCubit>().changeBudgetValue(budget);
              },
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                      controller: TextEditingController(
                          text: voyageStartDate != null
                              ? startDateFormated
                              : null),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: const Icon(Icons.calendar_today),
                        labelText: AppLocalizations.of(context).startDate,
                        contentPadding: const EdgeInsets.all(10),
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
                      controller: TextEditingController(
                          text: voyageEndDate != null ? endDateFormated : null),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: const Icon(Icons.calendar_today),
                        labelText: AppLocalizations.of(context).endDate,
                        contentPadding: const EdgeInsets.all(10),
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
              onChanged: ((value) {
                context.read<EditVoyageCubit>().changeDescriptionValue(value);
              }),
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
