part of 'voyages_cubit.dart';

@freezed
class VoyagesState with _$VoyagesState {
  factory VoyagesState({
    @Default(Status.initial) Status status,
    String? errorMessage,
    @Default([]) List<VoyageModel> voyages,
  }) = _VoyagesState;
}


// class VoyagesState {
//   const VoyagesState({
//     this.status = Status.initial,
//     this.errorMessage,
//     this.voyages = const [],
//   });

//   final Status status;
//   final String? errorMessage;
//   final List<VoyageModel> voyages;
// }
 