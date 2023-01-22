part of 'add_voyage_cubit.dart';

@immutable
class AddVoyageState {
  const AddVoyageState({
    this.status = Status.initial,
    this.saved = false,
    this.errorMessage = '',
    this.voyageTitles = const [],
  });

  final Status status;
  final bool saved;
  final String errorMessage;
  final List<String> voyageTitles;
}
