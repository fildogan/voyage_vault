import 'package:flutter/material.dart';
import 'package:travel_cost_log/app/features/home/pages/add_voyage/add_voyage_page.dart';

class AddPageContent extends StatelessWidget {
  const AddPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: (() {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddVoyagePage(),
                    fullscreenDialog: true,
                  ),
                );
              }),
              child: const Text('Add Voyage')),
          ElevatedButton(onPressed: (() {}), child: const Text('Add Expense')),
          const Center(
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
