import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage_vault/app/core/config.dart';
import 'package:voyage_vault/app/cubit/root_cubit.dart';
import 'package:voyage_vault/features/auth/pages/auth_gate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => RootCubit()..setPackageInfo(),
        child: BlocBuilder<RootCubit, RootState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: Config.debugShowCheckedModeBanner,
              title: 'Voyage Vault',
              theme: ThemeData.light(useMaterial3: true),
              darkTheme: ThemeData.dark(useMaterial3: true),
              themeMode: state.currentTheme,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'), // English
                Locale('pl'), // Polish
                Locale('fr'), // French
                Locale('it'), // Italian
                Locale('es'), // Spanish
              ],
              home: const AuthGate(),
            );
          },
        ),
      );
}
