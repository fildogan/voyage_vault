import 'package:flutter/material.dart';
import 'package:voyage_vault/app/core/enums.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({
    required this.buttonPosition,
    required this.onTap,
    required this.title,
    required this.trailing,
    super.key,
  });

  final void Function()? onTap;
  final ButtonPosition buttonPosition;
  final String title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // tileColor: Colors.black26,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: buttonPosition == ButtonPosition.top ||
                buttonPosition == ButtonPosition.single
            ? const Radius.circular(10)
            : const Radius.circular(0),
        topRight: buttonPosition == ButtonPosition.top ||
                buttonPosition == ButtonPosition.single
            ? const Radius.circular(10)
            : const Radius.circular(0),
        bottomLeft: buttonPosition == ButtonPosition.bottom ||
                buttonPosition == ButtonPosition.single
            ? const Radius.circular(10)
            : const Radius.circular(0),
        bottomRight: buttonPosition == ButtonPosition.bottom ||
                buttonPosition == ButtonPosition.single
            ? const Radius.circular(10)
            : const Radius.circular(0),
      )),
      onTap: onTap,
      title: Text(title),
      trailing: trailing,
    );
  }
}
