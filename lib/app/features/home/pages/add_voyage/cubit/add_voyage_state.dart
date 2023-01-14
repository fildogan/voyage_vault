part of 'add_voyage_cubit.dart';

@immutable
class AddVoyageState {
  const AddVoyageState({
    this.saved = false,
    this.errorMessage = '',
  });

  final bool saved;
  final String errorMessage;
}
