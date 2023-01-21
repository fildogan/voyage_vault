part of 'voyage_details_cubit.dart';

@immutable
class VoyageDetailsState {
  const VoyageDetailsState({
    this.status = Status.initial,
    this.errorMessage,
    this.voyageModel,
    this.expenses = const [],
  });

  final Status status;
  final String? errorMessage;
  final VoyageModel? voyageModel;
  final List<ExpenseModel> expenses;
}
