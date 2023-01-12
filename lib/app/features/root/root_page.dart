import 'package:flutter/material.dart';
import 'package:travel_cost_log/app/cubit/root_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_cost_log/app/features/home/home_page.dart';
import 'package:travel_cost_log/app/features/loading/loading_page.dart';
import 'package:travel_cost_log/app/features/login/login_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit()..start(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          final user = state.user;

          if (state.isLoading) {
            return const LoadingPage();
          }
          if (user == null) {
            return const LoginPage();
          }
          return const HomePage();
        },
      ),
    );
  }
}
