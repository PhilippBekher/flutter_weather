import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'name_text_field_state.dart';

class NameTextFieldCubit extends Cubit<NameTextFieldState> {
  NameTextFieldCubit() : super(NameTextFieldState(value: ''));

  void change_value(value) => emit(NameTextFieldState(value: value));
}
