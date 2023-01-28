part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

// ignore: must_be_immutable
class CreateUserEvent extends AuthEvent{

  String email;
  String password;
  String fcmToken;
  String name;

  CreateUserEvent({required this.fcmToken,required this.email,required this.password,required this.name});
}

// ignore: must_be_immutable
class SignInUserEvent extends AuthEvent{
  String email;
  String password;


  SignInUserEvent({required this.email,required this.password});
}

// ignore: must_be_immutable
class ValidatingStatusEvent extends AuthEvent{
  bool emailValidated = false;
  bool passwordValidated = false;

  String email;
  String password;

  ValidatingStatusEvent({required this.password,required this.email});
}

class CreateUserWithGoogle extends AuthEvent{
  String fcmToken;
  bool isCreate;

  CreateUserWithGoogle({required this.fcmToken,required this.isCreate});
}
