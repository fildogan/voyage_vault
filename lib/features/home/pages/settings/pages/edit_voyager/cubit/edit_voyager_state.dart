part of 'edit_voyager_cubit.dart';

@freezed
class EditVoyagerState with _$EditVoyagerState {
  factory EditVoyagerState({
    @Default(Status.initial) Status status,
    @Default(FormStatus.initial) FormStatus formStatus,
    @Default([]) List<VoyagerModel> voyagers,
    VoyagerModel? voyager,
    String? errorMessage,
    String? successMessage,
    @Default('') String initialName,
  }) = _EditVoyagerState;
  const EditVoyagerState._();

  bool get isNameValid =>
      (voyager?.name != null && (voyager?.name ?? '').isNotEmpty);
  bool get isColorValid => voyager?.color != null;
  bool get doesNameExist =>
      (voyagers
          .map((i) => i.name.toLowerCase())
          .contains(voyager?.name.toLowerCase())) &&
      (voyager?.name.toLowerCase() != initialName.toLowerCase());
}
