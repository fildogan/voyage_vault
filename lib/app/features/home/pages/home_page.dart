import 'package:flutter/material.dart';
import 'package:travel_cost_log/app/features/home/pages/add/add_page_content.dart';
import 'package:travel_cost_log/app/features/home/pages/my_account/my_account_page_content.dart';
import 'package:travel_cost_log/app/features/home/pages/voyages/voyages_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pageNavigation = [
    const VoyagesPageContent(),
    const AddPageContent(),
    const MyAccountPageContent(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageNavigation.elementAt(_currentIndex),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
        onTap: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.luggage), label: 'Voyages'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account')
        ]);
  }
}
