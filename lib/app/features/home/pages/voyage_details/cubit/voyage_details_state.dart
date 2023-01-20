part of 'voyage_details_cubit.dart';

@immutable
class VoyageDetailsState {
  const VoyageDetailsState({
    this.loadingErrorOccured = false,
    this.voyageModel,
    this.expenses = const [],
    this.totalPrice,
  });
  final bool loadingErrorOccured;
  final VoyageModel? voyageModel;
  final List<ExpenseModel> expenses;
  final double? totalPrice;
}
