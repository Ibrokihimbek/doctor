import 'package:doctor_app/bloc/auth/auth_bloc.dart';
import 'package:doctor_app/ui/auth/bloc/validate_bloc.dart';
import 'package:doctor_app/ui/auth/widgets/animated_snackbar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

// ignore: must_be_immutable
class AuthButton extends StatelessWidget {
  String email;
  String password;
  String name="";
  String title;
  AuthButton({required this.title, this.name="",required this.password,required this.email,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ValidateBloc,ValidatingStatusState>(
      listener: (context, state) {

      },
      builder: (context, state) => ZoomTapAnimation(
        onTap: () async {
          // ignore: unnecessary_type_check
          if(state is ValidatingStatusState){
            if(state.passwordValidated && state.emailValidated) {
              if (title == "Ro'yxatdan o'tish  ") {
                String? token = await FirebaseMessaging.instance.getToken();
                // ignore: use_build_context_synchronously
                context.read<AuthBloc>().add(CreateUserEvent(
                    fcmToken: token ?? "",
                    email: email,
                    password: password,
                    name: name));
              } else {
                context.read<AuthBloc>().add(
                    SignInUserEvent(email: email, password: password));
              }
            }else{
              MySnackBar(context, notification: "Validating failed", color: Colors.red, icon: Icon(Icons.info,color: Colors.white,));
            }
          }
        },
        child: Container(
          height: 55,
          width: MediaQuery.of(context).size.width,
          decoration:  BoxDecoration(
              gradient: const LinearGradient(
                  colors: [
                    Color(0xFF2972FE),
                    Color(0xFF6499FF),
                  ]
              ),
              borderRadius: BorderRadius.circular(12.r)
          ),
          child:  Center(child: Text(title,style: const TextStyle(color: Colors.white,fontSize: 16),)),
        ),
      ),
    );
  }
}