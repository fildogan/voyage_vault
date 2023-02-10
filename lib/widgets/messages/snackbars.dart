import 'package:flutter/material.dart';

class SuccessSnackbarr extends StatelessWidget {
  const SuccessSnackbarr({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Row(
        children: [
          const Icon(Icons.done),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
          ),
        ],
      ),
      backgroundColor: Colors.blue,
    );
  }
}

class ErrorSnackbar extends StatelessWidget {
  const ErrorSnackbar({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(
        text,
      ),
      backgroundColor: Colors.red,
    );
  }
}
