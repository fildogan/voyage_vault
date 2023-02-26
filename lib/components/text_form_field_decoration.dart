import 'package:flutter/material.dart';

InputDecoration textFormFieldDecoration(BuildContext context,
    {required String labelText, bool? enabled}) {
  return InputDecoration(
      border: const UnderlineInputBorder(),
      labelText: labelText,
      contentPadding: const EdgeInsets.all(10),
      enabled: enabled ?? true);
}
