import 'package:flutter/material.dart';

InputDecoration formFieldDecoration(BuildContext context,
    {required String labelText, bool? enabled, Widget? suffix}) {
  return InputDecoration(
      suffix: suffix,
      border: const UnderlineInputBorder(),
      labelText: labelText,
      contentPadding: const EdgeInsets.all(10),
      enabled: enabled ?? true);
}
