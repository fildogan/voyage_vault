import 'package:flutter/material.dart';
import 'package:voyage_vault/app/core/enums.dart';

class StatusSwitchCase extends StatelessWidget {
  final BuildContext context;
  final Widget Function() child;
  final Status status;
  final bool? ifCheck;
  final String? ifTrueMessage;
  final String? errorMessage;

  const StatusSwitchCase({
    Key? key,
    required this.context,
    required this.child,
    required this.status,
    this.ifCheck,
    this.ifTrueMessage,
    this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case Status.initial:
        return const Center(
          child: Text('Initial state'),
        );
      case Status.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case Status.success:
        // if ifCheck bool is true screen with ifTrueMessage is displayed
        if (ifCheck ?? false) {
          return Center(
            child: Text(ifTrueMessage ?? '404'),
          );
        }
        return SafeArea(
          child: child(),
        );
      case Status.error:
        return Center(
          child: Text(
            errorMessage ?? 'Unknown error',
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        );
    }
  }
}
