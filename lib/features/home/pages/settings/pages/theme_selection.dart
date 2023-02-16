import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage_vault/app/cubit/root_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeSelectionPage extends StatelessWidget {
  const ThemeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, RootState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
                '${AppLocalizations.of(context).choose} ${AppLocalizations.of(context).theme}'),
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
                              context.read<RootCubit>().setThemeDark();
                            },
                            title: const Text('Dark'),
                            trailing: state.currentTheme == ThemeMode.dark
                                ? const Icon(Icons.check_box)
                                : const Icon(Icons.check_box_outline_blank),
                          ),
                          const Seperator(),
                          ListTile(
                            onTap: () {
                              context.read<RootCubit>().setThemeLight();
                            },
                            title: const Text('Light'),
                            trailing: state.currentTheme == ThemeMode.light
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
                              context.read<RootCubit>().setThemeSystem();
                            },
                            title: const Text('System'),
                            trailing: state.currentTheme == ThemeMode.system
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
