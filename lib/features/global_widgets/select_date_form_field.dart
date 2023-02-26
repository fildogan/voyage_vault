import 'package:flutter/material.dart';

Widget selectDateFormField({
  required BuildContext context,
  required String controllerText,
  required String labelText,
  required Future<void> Function(DateTime) changeDate,
  DateTime? initialDate,
  String? Function(String?)? validator,
}) {
  return TextFormField(
      controller: TextEditingController(text: controllerText),
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: const Icon(Icons.calendar_today),
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 12),
        contentPadding: const EdgeInsets.all(10),
      ),
      readOnly: true, // when true user cannot edit text
      onTap: () async {
        await showDatePicker(
          context: context,
          initialDate: initialDate ?? DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
        ).then((selectedDate) {
          if (selectedDate != null) {
            changeDate(selectedDate);
          }
        });
      },
      validator: validator);
}
