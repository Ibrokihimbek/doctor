import 'package:doctor_app/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'dart:core';
import 'package:email_validator/email_validator.dart';


part 'auth_event.dart';
part 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<CreateUserEvent>(_createUser);
    on<SignInUserEvent>(_signIn);
    on<CreateUserWithGoogle>(_createAccountWithGoogle);
  }

  final AuthRepository authRepository;


  _createUser(CreateUserEvent event,Emitter emit) async{
    emit(SigningInProgress());
    // await Future.delayed(const Duration(seconds: 3));
    var response = await authRepository.signUp(email: event.email, password: event.password, fcmToken: event.fcmToken,name: event.name);
    if (response == "Registered Successfully") {
      //success
      emit(CreateUserInSuccess());
    } else {
      //error
      emit(CreateUserInFailury(errorText: response));
      print("Error: $response");

    }
  }

  _signIn(SignInUserEvent event,Emitter emit) async{
    emit(SigningInProgress());
    // await Future.delayed(Duration(seconds: 3));
    var response = await authRepository.signIn(event.email, event.password);
    if (response == "Welcome") {
      //success
      emit(UserSignedInSuccessfully());
    } else {
      //error
      emit(UserSignedInFailury(errorText: response));
    }
  }

  _createAccountWithGoogle(CreateUserWithGoogle event,Emitter emit)async{
    var result = await authRepository.signInWithGoogle(event.fcmToken,event.isCreate);
    // emit(SigningInProgress());
    // await Future.delayed(Duration(seconds: 3));
    if(result is String){
      emit(UserSignedInFailury(errorText: result));
    }else{
      emit(UserSignedInSuccessfully());
    }
  }

  _validate(ValidatingStatusEvent event,Emitter emit){
    event.emailValidated=EmailValidator.validate(event.email);
    event.passwordValidated=event.password.length>6;
    emit(ValidatingStatus(emailValidated: event.emailValidated,passwordValidated: event.passwordValidated));
  }
}
