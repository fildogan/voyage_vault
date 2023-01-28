import 'package:flutter/material.dart';
import 'package:travel_cost_log/features/home/pages/add_expense/add_expense_page.dart';
import 'package:travel_cost_log/features/home/pages/add_voyage/add_voyage_page.dart';

class AddPageContent extends StatelessWidget {
  const AddPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Image.asset(
              'images/logo1.png',
              height: 300,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddVoyagePage(),
                  fullscreenDialog: true,
                ),
              ),
              child: const Text('Add Voyage'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddExpensePage(),
                  fullscreenDialog: true,
                ),
              ),
              child: const Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
