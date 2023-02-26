import 'package:flutter/material.dart';

InputDecoration textFormFieldDecoration(BuildContext context,
    {required String labelText}) {
  return InputDecoration(
    border: const UnderlineInputBorder(),
    labelText: labelText,
    contentPadding: const EdgeInsets.all(10),
  );
}
