import 'package:doctor_app/bloc/auth/auth_bloc.dart';
import 'package:doctor_app/ui/auth/widgets/animated_snackbar.dart';
import 'package:doctor_app/ui/auth/widgets/auth_button.dart';
import 'package:doctor_app/ui/auth/widgets/auth_with.dart';
import 'package:doctor_app/ui/auth/widgets/text_field.dart';
import 'package:doctor_app/ui/widgets/widgets.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:doctor_app/utils/icons/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/dialogs.dart';

// ignore: must_be_immutable
class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc,AuthState>(
      builder: (context, state) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics:const  BouncingScrollPhysics(),
            child: Container(
              padding:  EdgeInsets.all(m_h(context)*0.028),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppIcons.logoWithBackground,
                    width: m_w(context)*0.55,
                  ),
                   SizedBox(
                    height: m_h(context)*0.022,
                  ),
                   Text(
                    "Sign in to your account",
                    style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
                  ),
                  CustomTextField(controller: emailController,hintText: "Email",),
                  CustomTextField(controller: passwordController,hintText: "Password",),
                  SizedBox(
                    height: m_h(context)*0.022,
                  ),
                  AuthButton(title: "Sign In",password: passwordController.text,email: emailController.text),
                   SizedBox(
                    height: m_h(context)*0.003,
                  ),
                   SizedBox(
                    height: m_h(context)*0.03,
                  ),
                   Text("or continue with",style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.w500),),
                   SizedBox(
                    height: m_h(context)*0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AuthWithButton(title: "Facebook", image: AppIcons.facebook,isCreate: false),
                      AuthWithButton(title: "Google", image: AppIcons.google,isCreate: false),
                    ],
                  ),
                   SizedBox(
                    height: m_h(context)*0.07,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text("Don't have an account? ",style: TextStyle(color: Colors.grey,fontSize: 18.sp),),
                      InkWell(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, signUpPage);
                          },
                          child:  Text("Sign Up",style: TextStyle(color: MyColors.primary,fontWeight: FontWeight.bold,fontSize: 18.sp),))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
     listener: (context, state) {
       if(state is SigningInProgress){
         showDialog(
           context: context,
           barrierDismissible: false,
           builder: (BuildContext context) => loadingDialog(),
         );
       }
       if(state is UserSignedInFailury){
         Navigator.pop(context);
         MySnackBar(context, notification: state.errorText, color: Colors.red, icon: Icon(Icons.error,color: Colors.white,));
       }
       if(state is UserSignedInSuccessfully){
         Navigator.pushNamedAndRemoveUntil(context, tabBox, (route) => false);
       }
     },
    );
  }
}
