import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit()
      : super(const RootState(
          user: null,
          isLoading: false,
          errorMessage: '',
        ));
}
