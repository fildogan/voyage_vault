import 'package:flutter/material.dart';
import 'package:travel_cost_log/app/features/home/pages/home_page.dart';

class AddVoyagePage extends StatelessWidget {
  const AddVoyagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [TextField()]),
      ),
    );
  }
}
