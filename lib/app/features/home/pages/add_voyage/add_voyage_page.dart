import 'package:flutter/material.dart';
import 'package:travel_cost_log/app/features/home/pages/home_page.dart';

class AddVoyagePage extends StatefulWidget {
  const AddVoyagePage({super.key});

  @override
  State<AddVoyagePage> createState() => _AddVoyagePageState();
}

class _AddVoyagePageState extends State<AddVoyagePage> {
  String? _title;
  DateTime? _startDate;
  DateTime? _endDate;

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
