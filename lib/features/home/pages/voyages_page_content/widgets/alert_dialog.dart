import 'package:flutter/material.dart';
import 'package:travel_cost_log/domain/models/voyage_model.dart';

class RemoveVoyageAlertDialog extends StatelessWidget {
  const RemoveVoyageAlertDialog({
    super.key,
    required this.voyageModel,
  });

  final VoyageModel voyageModel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete voyage ${voyageModel.title}?'),
      content: const Text(
        'Deleting this voyage will also permanently delete all of its associated expenses. This action is irreversible.',
      ),
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
