part of 'voyage_details_cubit.dart';

@freezed
class VoyageDetailsState with _$VoyageDetailsState {
  factory VoyageDetailsState({
    @Default(Status.initial) Status status,
    String? errorMessage,
    VoyageModel? voyageModel,
    @Default([]) List<ExpenseModel> expenses,
  }) = _VoyageDetailsState;
}

// @immutable
// class VoyageDetailsState {
//   const VoyageDetailsState({
//     this.status = Status.initial,
//     this.errorMessage,
//     this.voyageModel,
//     this.expenses = const [],
//   });

//   final Status status;
//   final String? errorMessage;
//   final VoyageModel? voyageModel;
//   final List<ExpenseModel> expenses;
// }
