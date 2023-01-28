import 'package:flutter/material.dart';
import 'package:travel_cost_log/features/auth/pages/user_profile.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.person),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const UserProfile(),
                  ),
                ),
                child: const Text('Go to user page'),
              ),
              const Text('Settings'),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black26),
                child: Column(
                  children: [
                    ListTile(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const UserProfile(),
                          ),
                        );
                      },
                      title: const Text('Account settings'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black38),
                          ),
                        ),
                      ),
                    ),
                    const ListTile(
                      title: Text('1'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
