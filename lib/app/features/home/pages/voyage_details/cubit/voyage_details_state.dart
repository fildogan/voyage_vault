part of 'voyage_details_cubit.dart';

@immutable
class VoyageDetailsState {
  const VoyageDetailsState({
    this.loadingErrorOccured = false,
    this.voyageModel,
    this.expenses = const [],
  });
  final bool loadingErrorOccured;
  final VoyageModel? voyageModel;
  final List<ExpenseModel> expenses;
}
