import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_cost_log/app/core/config.dart';
import 'package:travel_cost_log/app/cubit/root_cubit.dart';
import 'package:travel_cost_log/features/auth/pages/auth_gate.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => RootCubit(),
        child: BlocBuilder<RootCubit, RootState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: Config.debugShowCheckedModeBanner,
              title: 'Travel Cost Log',
              theme: ThemeData.light(useMaterial3: true),
              darkTheme: ThemeData.dark(useMaterial3: true),
              themeMode: state.currentTheme,
              home: const AuthGate(),
            );
          },
        ),
      );
}
