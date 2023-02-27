import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/components/save_app_bar_button.dart';

class AddEditAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddEditAppBar({
    super.key,
    required this.saveAction,
    required this.appBar,
    required this.title,
    this.formStatus,
  });

  final void Function()? saveAction;
  final AppBar appBar;
  final String title;
  final FormStatus? formStatus;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.pink,
      title: AutoSizeText(
        title,
        maxLines: 1,
      ),
      actions: [
        SaveAppBarButton(
          onPressed: formStatus == FormStatus.submitting ? null : saveAction,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
