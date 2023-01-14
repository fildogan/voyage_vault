import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 1;
  final List<Widget> _pageNavigation = [
    const VoyagesPageContent(),
    const AddPageContent(),
    const MyAccountPageContent(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageNavigation.elementAt(currentIndex),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.white,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.luggage), label: 'Voyages'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account')
        ]);
  }
}

class VoyagesPageContent extends StatelessWidget {
  const VoyagesPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.luggage),
    );
  }
}

class AddPageContent extends StatelessWidget {
  const AddPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.add),
    );
  }
}

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.person),
    );
  }
}
