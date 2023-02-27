import 'package:flutter/material.dart';
import 'package:voyage_vault/app/core/enums.dart';

class AddEditListener {
  final BuildContext context;
  final FormStatus formStatus;
  final String? errorMessage;
  final String? successMessage;

  AddEditListener({
    required this.context,
    required this.formStatus,
    this.errorMessage,
    this.successMessage,
  });
  void listen() {
    if (formStatus == FormStatus.success) {
      Navigator.of(context).pop();
    }

    if (errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage!),
          backgroundColor: Colors.red,
        ),
      );
    }

    if (successMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.done),
              const SizedBox(width: 10),
              Text(successMessage!),
            ],
          ),
        ),
      );
    }
  }
}
