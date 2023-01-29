import 'package:auto_size_text/auto_size_text.dart';
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
              const SizedBox(height: 20),
              const Text('Account'),
              const SizedBox(height: 10),
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
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10),
                    //   child: Container(
                    //     decoration: const BoxDecoration(
                    //       border: Border(
                    //         bottom: BorderSide(color: Colors.black38),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const ListTile(
                    //   title: Text('1'),
                    // ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text('Application'),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black26),
                child: Column(
                  children: [
                    ListTile(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      onTap: () {},
                      title: const Text('Theme'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                    const Seperator(),
                    ListTile(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      onTap: () {},
                      title: const Text('Language'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text('About'),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black26),
                child: Column(
                  children: [
                    const ListTile(
                      // shape: const RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.only(
                      //         topLeft: Radius.circular(10),
                      //         topRight: Radius.circular(10))),
                      // onTap: () {},
                      title: Text('App name'),
                      trailing: Text('Voyage Vault'),
                    ),
                    const Seperator(),
                    const ListTile(
                      // shape: const RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.only(
                      //         topLeft: Radius.circular(10),
                      //         topRight: Radius.circular(10))),
                      // onTap: () {},
                      title: Text('App version'),
                      trailing: Text('1.0'),
                    ),
                    const Seperator(),
                    const ListTile(
                      title: Text('Minimun OS version'),
                      trailing: Text('16.0'),
                    ),
                    const Seperator(),
                    ListTile(
                      // shape: const RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.only(
                      //         topLeft: Radius.circular(10),
                      //         topRight: Radius.circular(10))),
                      onTap: () {},
                      title: const Text('Rate us'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                    const Seperator(),
                    ListTile(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      onTap: () {},
                      title: const Text('Contact us'),
                      trailing: const Icon(Icons.email),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text('Legal'),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black26),
                child: Column(
                  children: [
                    ListTile(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      onTap: () {},
                      title: const Text('Terms of Use'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                    const Seperator(),
                    ListTile(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      onTap: () {},
                      title: const Text('Privacy Policy'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'images/logo1.png',
                height: 100,
              ),
              const SizedBox(height: 20),
              const Center(
                child: AutoSizeText(
                  'VoyageVault 1.0 (1)',
                  maxLines: 1,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class Seperator extends StatelessWidget {
  const Seperator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black38),
          ),
        ),
      ),
    );
  }
}
