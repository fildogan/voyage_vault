import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableActionDelete extends StatelessWidget {
  const SlidableActionDelete({
    super.key,
    required this.onPressed,
  });

  final void Function(BuildContext)? onPressed;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: onPressed,
      backgroundColor: const Color(0xFFFE4A49),
      foregroundColor: Colors.white,
      icon: Icons.delete,
      label: AppLocalizations.of(context).delete,
    );
  }
}
