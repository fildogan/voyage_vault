import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:voyage_vault/app/cubit/root_cubit.dart';
import 'package:voyage_vault/domain/models/setting_item_model.dart';
import 'package:voyage_vault/features/auth/pages/user_profile.dart';
import 'package:voyage_vault/features/home/pages/settings/pages/language_selection.dart';
import 'package:voyage_vault/features/home/pages/settings/pages/theme_selection.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:io' show Platform;

import 'package:voyage_vault/features/home/pages/settings/widgets/settings_item.dart';

class SettingsPageContent extends StatelessWidget {
  const SettingsPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, RootState>(
      builder: (context, state) {
        final PackageInfo packageinfo = state.packageInfo ??
            PackageInfo(
                appName: 'Unknown',
                packageName: 'Unknown',
                version: 'Unknown',
                buildNumber: 'Unknown');
        return SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Account
                  SettingsItem(settingsItems: [
                    SettingItemModel(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const UserProfile(),
                          ),
                        );
                      },
                      title: AppLocalizations.of(context).accountSettings,
                      trailing: const Icon(Icons.chevron_right),
                    )
                  ], header: AppLocalizations.of(context).account),
                  // Application
                  SettingsItem(
                    header: AppLocalizations.of(context).application,
                    settingsItems: [
                      SettingItemModel(
                        title: AppLocalizations.of(context).theme,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ThemeSelectionPage(),
                            ),
                          );
                        },
                        trailing: const Icon(Icons.chevron_right),
                      ),
                      SettingItemModel(
                        title: AppLocalizations.of(context).language,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const LanguageSelectionPage(),
                            ),
                          );
                        },
                        trailing: const Icon(Icons.chevron_right),
                      )
                    ],
                  ),
                  // About
                  SettingsItem(settingsItems: [
                    SettingItemModel(
                      title: AppLocalizations.of(context).appName,
                      trailing: Text(packageinfo.appName),
                    ),
                    SettingItemModel(
                      title: AppLocalizations.of(context).appVersion,
                      trailing: Text(
                          '${packageinfo.version} (${packageinfo.buildNumber})'),
                    ),
                    SettingItemModel(
                      title: AppLocalizations.of(context).minOsVersion,
                      trailing: Platform.isAndroid
                          ? const Text('21')
                          : const Text('10.14'),
                    ),
                    SettingItemModel(
                      title: AppLocalizations.of(context).rateUs,
                      trailing: const Icon(Icons.chevron_right),
                    ),
                    SettingItemModel(
                      title: AppLocalizations.of(context).contactUs,
                      trailing: const Icon(Icons.email),
                      onTap: () {
                        launchEmail();
                      },
                    )
                  ], header: AppLocalizations.of(context).about),
                  // Legal
                  SettingsItem(settingsItems: [
                    SettingItemModel(
                      title: AppLocalizations.of(context).termsOfUse,
                      trailing: const Icon(Icons.chevron_right),
                    ),
                    SettingItemModel(
                      title: AppLocalizations.of(context).privacyPolicy,
                      trailing: const Icon(Icons.chevron_right),
                    )
                  ], header: AppLocalizations.of(context).legal),
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/images/logo1.png',
                    height: 100,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: AutoSizeText(
                      '${AppLocalizations.of(context).voyageVault} ${packageinfo.version} (${packageinfo.buildNumber})',
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future launchEmail() async {
    String email = Uri.encodeComponent("filip.doganowski@gmail.com");
    String subject = Uri.encodeComponent("Feedback");
    String body = Uri.encodeComponent("Hi!\nHere is my feedback:\n");
    Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
    try {
      if (await launchUrl(mail)) {
        //email app opened
      } else {
        //email app is not opened
        throw 'Could not launch email app';
      }
    } on Exception catch (e) {
      print('Error launching email: $e');
      // Handle the error here, such as showing an error message to the user
    }
  }
}
