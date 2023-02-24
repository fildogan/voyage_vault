import 'package:flutter/material.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/domain/models/setting_item_model.dart';
import 'package:voyage_vault/features/home/pages/settings/pages/language_selection.dart';
import 'package:voyage_vault/features/home/pages/settings/widgets/header.dart';
import 'package:voyage_vault/features/home/pages/settings/widgets/setting_buton.dart';

@immutable
class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.settingsItems,
    required this.header,
  });

  final List<SettingItemModel> settingsItems;
  final i = 0;
  final String header;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Header(header),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black26),
          child: Column(
            children: [
              for (int i = 0;
                  i < settingsItems.length;
                  i++
                  // final item in settingsItems
                  ) ...[
                SettingButton(
                  title: settingsItems[i].title,
                  buttonPosition: settingsItems.length == 1
                      ? ButtonPosition.single
                      : i == 0
                          ? ButtonPosition.top
                          : i == settingsItems.length - 2
                              ? ButtonPosition.bottom
                              : ButtonPosition.middle,
                  onTap: settingsItems[i].onTap,
                  trailing: settingsItems[i].trailing,
                ),
                if (i != settingsItems.length - 1) const Seperator(),
              ]
            ],
          ),
        ),
      ],
    );
  }
}
