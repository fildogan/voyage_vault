import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:voyage_vault/app/core/enums.dart';
import 'package:voyage_vault/domain/models/voyager_model.dart';

part 'add_voyager_state.dart';
part 'add_voyager_cubit.freezed.dart';

@injectable
class AddVoyagerCubit extends Cubit<AddVoyagerState> {
  AddVoyagerCubit() : super(AddVoyagerState());
}
