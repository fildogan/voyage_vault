import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/domain/models/settings_model.dart';

class PreferencesService {
  Future saveTheme(SelectedTheme selectedTheme) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setInt('theme', selectedTheme.index);
    print('Saved Theme');
  }

  Future saveLanguage(SelectedLanguage selectedLanguage) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setInt('language', selectedLanguage.index);
    print('Saved Language');
  }

  Future getSettings() async {
    final preferences = await SharedPreferences.getInstance();
    final selectedTheme =
        SelectedTheme.values[preferences.getInt('theme') ?? 2];
    final selectedLanguage =
        SelectedLanguage.values[preferences.getInt('language') ?? 5];

    return SettingsModel(
        selectedLanguage: selectedLanguage, selectedTheme: selectedTheme);
  }
}
