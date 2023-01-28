part of 'validate_bloc.dart';

abstract class ValidateEvent {}

class ValidatingEmailEvent extends ValidateEvent {
  final String email;

  ValidatingEmailEvent({required this.email});
}

class ValidatingPasswordEvent extends ValidateEvent {
  final String password;

  ValidatingPasswordEvent({required this.password});
}
