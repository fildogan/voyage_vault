import 'package:flutter/material.dart';
import 'package:travel_cost_log/app/features/auth/pages/user_profile.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const UserProfile(),
                ),
              ),
              child: const Text('Go to user page'),
            )
          ],
        ),
      ),
    );
  }
}
