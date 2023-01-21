part of 'add_voyage_cubit.dart';

@immutable
class AddVoyageState {
  const AddVoyageState({
    this.status = Status.initial,
    this.saved = false,
    this.errorMessage = '',
    this.loadingErrorOccured = false,
    this.voyageTitles = const [],
  });

  final Status status;
  final bool saved;
  final String errorMessage;
  final bool loadingErrorOccured;
  final List<String> voyageTitles;
}
