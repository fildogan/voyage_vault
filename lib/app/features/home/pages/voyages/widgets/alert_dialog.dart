import 'package:flutter/material.dart';
import 'package:travel_cost_log/app/models/voyage_model.dart';

class RemoveVoyageAlertDialog extends StatelessWidget {
  const RemoveVoyageAlertDialog({
    super.key,
    required this.voyageModel,
  });

  final VoyageModel voyageModel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Remove voyage?'),
      content: Text('Voyage: ${voyageModel.title}'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Yes'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('No'),
        )
      ],
    );
  }
}
