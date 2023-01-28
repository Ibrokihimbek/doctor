part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class SigningInProgress extends AuthState{}


//Create user
class CreateUserInSuccess extends AuthState{}

// ignore: must_be_immutable
class CreateUserInFailury extends AuthState{
  String errorText;
  CreateUserInFailury({required this.errorText});
}


//Sign In

class UserSignedInSuccessfully extends AuthState{}

// ignore: must_be_immutable
class UserSignedInFailury extends AuthState{
  String errorText;

  UserSignedInFailury({required this.errorText});
}


//Validating

// ignore: must_be_immutable
class ValidatingStatus extends AuthState{
  bool? emailValidated;
  bool? passwordValidated;
  ValidatingStatus({required this.passwordValidated,required this.emailValidated});
}




