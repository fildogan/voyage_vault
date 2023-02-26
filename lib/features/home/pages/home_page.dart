import 'package:flutter/material.dart';
import 'package:voyage_vault/features/home/pages/add_page_content/add_page_content.dart';
import 'package:voyage_vault/features/home/pages/settings/settings_page.dart';
import 'package:voyage_vault/features/home/pages/voyages_page_content/voyages_page_content.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@immutable
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  final List<Widget> _pageNavigation = [
    const VoyagesPageContent(),
    const AddPageContent(),
    const SettingsPageContent(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageNavigation.elementAt(_currentIndex),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() => BottomNavigationBar(
        onTap: (newIndex) => setState(
          () => _currentIndex = newIndex,
        ),
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.airplanemode_active),
              label: AppLocalizations.of(context).voyages),
          BottomNavigationBarItem(
              icon: const Icon(Icons.add),
              label: AppLocalizations.of(context).add),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: AppLocalizations.of(context).account)
        ],
      );
}
