part of 'add_voyage_cubit.dart';

@immutable
class AddVoyageState {
  const AddVoyageState({
    this.saved = false,
    this.errorMessage = '',
    this.loadingErrorOccured = false,
    this.voyageTitles = const [],
  });

  final bool saved;
  final String errorMessage;
  final bool loadingErrorOccured;
  final List<String> voyageTitles;
}
