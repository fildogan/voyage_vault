import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SaveAppBarButton extends StatelessWidget {
  const SaveAppBarButton({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: TextButton(
        onPressed: onPressed,
        child: Text(AppLocalizations.of(context).save),
      ),
    );
  }
}
