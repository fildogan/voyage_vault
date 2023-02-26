import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableActionEdit extends StatelessWidget {
  const SlidableActionEdit({
    required this.onPressed,
    super.key,
  });

  final void Function(BuildContext)? onPressed;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: onPressed,
      backgroundColor: const Color(0xFF21B7CA),
      foregroundColor: Colors.white,
      icon: Icons.edit,
      label: AppLocalizations.of(context).edit,
    );
  }
}
