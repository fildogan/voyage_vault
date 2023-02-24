import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@immutable
class AddVoyagePageBody extends StatelessWidget {
  const AddVoyagePageBody({
    super.key,
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
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: AppLocalizations.of(context).voyageName,
                contentPadding: const EdgeInsets.all(10),
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
                onBudgetChanged(budget);
              },
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                      controller:
                          TextEditingController(text: startDateFormated),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: const Icon(Icons.calendar_today),
                        labelText: AppLocalizations.of(context).startDate,
                        labelStyle: const TextStyle(fontSize: 12),
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
                      controller: TextEditingController(text: endDateFormated),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: const Icon(Icons.calendar_today),
                        labelText: AppLocalizations.of(context).endDate,
                        labelStyle: const TextStyle(fontSize: 12),
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
