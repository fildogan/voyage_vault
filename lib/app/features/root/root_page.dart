import 'package:flutter/material.dart';
import 'package:travel_cost_log/app/cubit/root_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            return const Scaffold();
          }
          if (user == null) {
            return const Scaffold();
          }
          return const Scaffold();
        },
      ),
    );
  }
}
