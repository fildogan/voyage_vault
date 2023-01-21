part of 'voyage_details_cubit.dart';

@immutable
class VoyageDetailsState {
  const VoyageDetailsState({
    this.status = Status.initial,
    this.loadingErrorOccured = false,
    this.voyageModel,
    this.expenses = const [],
  });

  final Status status;
  final bool loadingErrorOccured;
  final VoyageModel? voyageModel;
  final List<ExpenseModel> expenses;
}
