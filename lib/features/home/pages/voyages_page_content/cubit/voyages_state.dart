part of 'voyages_cubit.dart';

@immutable
class VoyagesState {
  const VoyagesState({
    this.status = Status.initial,
    this.voyages = const [],
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });

  final Status status;
  final List<VoyageModel> voyages;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}
