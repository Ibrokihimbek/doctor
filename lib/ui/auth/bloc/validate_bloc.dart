import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'validate_event.dart';

part 'validate_state.dart';

class ValidateBloc extends Bloc<ValidateEvent, ValidatingStatusState> {
  ValidateBloc()
      : super(
          const ValidatingStatusState(
            passwordValidated: false,
            emailValidated: false,
          ),
        ) {
    on<ValidatingEmailEvent>(_validateEmail);
    on<ValidatingPasswordEvent>(_validatePassword);
  }

  _validateEmail(
      ValidatingEmailEvent event, Emitter<ValidatingStatusState> emit) {
    emit(state.copyWith(emailValidated: EmailValidator.validate(event.email)));
  }

  _validatePassword(
      ValidatingPasswordEvent event, Emitter<ValidatingStatusState> emit) {
    emit(state.copyWith(passwordValidated: event.password.length > 6));
  }
}
