part of 'voyages_cubit.dart';

@immutable
class VoyagesState {
  const VoyagesState({
    this.voyages = const [],
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });
  final List<VoyageModel> voyages;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}
