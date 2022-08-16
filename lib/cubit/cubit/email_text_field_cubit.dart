import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'email_text_field_state.dart';

class EmailTextFieldCubit extends Cubit<EmailTextFieldState> {
  EmailTextFieldCubit() : super(EmailTextFieldState(value: ''));

  void change_value(val) => emit(EmailTextFieldState(value: val));
}
