import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/app/cubit/root_cubit.dart';

class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, RootState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text('Choose Language'),
          ),
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
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
                              context.read<RootCubit>().setLanguageEnglish();
                            },
                            title: const Text('English'),
                            trailing: state.selectedLanguage ==
                                    SelectedLanguage.english
                                ? const Icon(Icons.check_box)
                                : const Icon(Icons.check_box_outline_blank),
                          ),
                          const Seperator(),
                          ListTile(
                            onTap: () {
                              context.read<RootCubit>().setLanguageSpanish();
                            },
                            title: const Text('Spanish'),
                            trailing: state.selectedLanguage ==
                                    SelectedLanguage.spanish
                                ? const Icon(Icons.check_box)
                                : const Icon(Icons.check_box_outline_blank),
                          ),
                          const Seperator(),
                          ListTile(
                            onTap: () {
                              context.read<RootCubit>().setLanguageFrench();
                            },
                            title: const Text('French'),
                            trailing: state.selectedLanguage ==
                                    SelectedLanguage.french
                                ? const Icon(Icons.check_box)
                                : const Icon(Icons.check_box_outline_blank),
                          ),
                          const Seperator(),
                          ListTile(
                            onTap: () {
                              context.read<RootCubit>().setLanguageItalian();
                            },
                            title: const Text('Italian'),
                            trailing: state.selectedLanguage ==
                                    SelectedLanguage.italian
                                ? const Icon(Icons.check_box)
                                : const Icon(Icons.check_box_outline_blank),
                          ),
                          const Seperator(),
                          ListTile(
                            onTap: () {
                              context.read<RootCubit>().setLanguagePolish();
                            },
                            title: const Text('Polish'),
                            trailing: state.selectedLanguage ==
                                    SelectedLanguage.polish
                                ? const Icon(Icons.check_box)
                                : const Icon(Icons.check_box_outline_blank),
                          ),
                          const Seperator(),
                          ListTile(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            onTap: () {
                              context.read<RootCubit>().setLanguageSystem();
                            },
                            title: const Text('System'),
                            trailing: state.selectedLanguage ==
                                    SelectedLanguage.system
                                ? const Icon(Icons.check_box)
                                : const Icon(Icons.check_box_outline_blank),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
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
