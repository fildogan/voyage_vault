part of 'add_voyage_cubit.dart';

@freezed
class AddVoyageState with _$AddVoyageState {
  factory AddVoyageState({
    @Default(Status.initial) Status status,
    @Default(false) bool saved,
    String? errorMessage,
    String? successMessage,
    @Default([]) List<String> voyageTitles,
  }) = _AddVoyageState;
}

// @immutable
// class AddVoyageState {
//   const AddVoyageState({
//     this.status = Status.initial,
//     this.saved = false,
//     this.errorMessage = '',
//     this.voyageTitles = const [],
//   });

//   final Status status;
//   final bool saved;
//   final String errorMessage;
//   final List<String> voyageTitles;
// }
