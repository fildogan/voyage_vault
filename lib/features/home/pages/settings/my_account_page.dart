import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:voyage_vault/app/cubit/root_cubit.dart';
import 'package:voyage_vault/features/auth/pages/user_profile.dart';
import 'package:voyage_vault/features/home/pages/settings/pages/language_selection.dart';
import 'package:voyage_vault/features/home/pages/settings/pages/theme_selection.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, RootState>(
      builder: (context, state) {
        final PackageInfo packageinfo = state.packageInfo ??
            PackageInfo(
                appName: 'Unknown',
                packageName: 'Unknown',
                version: 'Unknown',
                buildNumber: 'Unknown');
        return SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(AppLocalizations.of(context).account),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black26),
                    child: Column(
                      children: [
                        ListTile(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const UserProfile(),
                              ),
                            );
                          },
                          title: Text(
                              AppLocalizations.of(context).accountSettings),
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
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ThemeSelectionPage(),
                              ),
                            );
                          },
                          title: Text(AppLocalizations.of(context).theme),
                          trailing: const Icon(Icons.chevron_right),
                        ),
                        const Seperator(),
                        ListTile(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const LanguageSelectionPage(),
                              ),
                            );
                          },
                          title: Text(AppLocalizations.of(context).language),
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
                        ListTile(
                          // shape: const RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.only(
                          //         topLeft: Radius.circular(10),
                          //         topRight: Radius.circular(10))),
                          // onTap: () {},
                          title: const Text('App name'),
                          trailing: Text(packageinfo.appName),
                        ),
                        const Seperator(),
                        ListTile(
                          // shape: const RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.only(
                          //         topLeft: Radius.circular(10),
                          //         topRight: Radius.circular(10))),
                          // onTap: () {},
                          title: const Text('App version'),
                          trailing: Text(
                              '${packageinfo.version} (${packageinfo.buildNumber})'),
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
                          onTap: () {
                            launchEmail();
                          },
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
                    'assets/images/logo1.png',
                    height: 100,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: AutoSizeText(
                      '${AppLocalizations.of(context).voyageVault} ${packageinfo.version} (${packageinfo.buildNumber})',
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future launchEmail() async {
    String email = Uri.encodeComponent("filip.doganowski@gmail.com");
    String subject = Uri.encodeComponent("Feedback");
    String body = Uri.encodeComponent("Hi!\nHere is my feedback:\n");
    print(subject); //output: Hello%20Flutter
    Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
    try {
      if (await launchUrl(mail)) {
        //email app opened
      } else {
        //email app is not opened
        throw 'Could not launch email app';
      }
    } on Exception catch (e) {
      print('Error launching email: $e');
      // Handle the error here, such as showing an error message to the user
    }

    // Future<void> launchEmail() async {
    //   final email = 'mail@fluttercampus.com';
    //   final subject = 'Hello Flutter';
    //   final body = 'Hi! I\'m a Flutter Developer';
    //   final uri = Uri(
    //     scheme: 'mailto',
    //     path: email,
    //     queryParameters: {
    //       'subject': subject,
    //       'body': body,
    //     },
    //   );
    //   try {
    //     final success = await launch(uri.toString());
    //     if (!success) {
    //       throw 'Could not launch email app';
    //     }
    //   } on Exception catch (e) {
    //     print('Error launching email: $e');
    //     // Handle the error here, such as showing an error message to the user
    //   }

    // final Uri emailLaunchUri = Uri(
    //   scheme: 'mailto',
    //   path: 'filip.doganowski@gmail.com',
    //   queryParameters: {
    //     'subject': 'Help',
    //     'body': 'Please help',
    //   },
    // );

    // final urlString = emailLaunchUri.toString();
    // if (await canLaunch(urlString)) {
    //   await launch(urlString);
    //   print('jjj');
    // }

    print('object');
  }

  // Future launchEmail() async {
  //   const url =
  //       'mailto:filip.doganowski@gmail.com?subject=Help&body=Please help';

  //   // if (await canLaunch(url)) {
  //   //   await launch(url);
  //   //   print('jjj');
  //   // }
  //   await canLaunch(url) ? await launch(url) : print('ggg');

  //   print('object');
  // }
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
