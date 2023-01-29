import 'package:doctor_app/bloc/auth/auth_bloc.dart';
import 'package:doctor_app/ui/auth/widgets/animated_snackbar.dart';
import 'package:doctor_app/ui/auth/widgets/auth_button.dart';
import 'package:doctor_app/ui/auth/widgets/auth_with.dart';
import 'package:doctor_app/ui/auth/widgets/dialogs.dart';
import 'package:doctor_app/ui/auth/widgets/text_field.dart';
import 'package:doctor_app/ui/widgets/widgets.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../../utils/constants.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is SigningInProgress) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext loadingContext) => loadingDialog(),
          );
        }
        if (state is CreateUserInFailury) {
          MySnackBar(context,
              notification: state.errorText,
              color: Colors.red,
              icon: const Icon(
                Icons.error,
                color: Colors.white,
              ));
        }

        if (state is CreateUserInSuccess || state is UserSignedInSuccessfully) {
          showDialog(
              builder: (context) => loadingDialog(
                    widget: Lottie.asset("assets/lottie/welcome.json"),
                  ),
              context: context);
          await Future.delayed(const Duration(seconds: 3));
          // ignore: use_build_context_synchronously
          Navigator.pushNamedAndRemoveUntil(context, tabBox, (route) => false);
        }
      },
      builder: (context, state) => Scaffold(
        body: SafeArea(
          child: KeyboardDismisser(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.all(m_h(context) * 0.028),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppIcons.logoWithBackground,
                      width: m_w(context) * 0.4,
                    ),
                    SizedBox(
                      height: m_h(context) * 0.06,
                    ),
                    Text(
                      "Sign up for free",
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.w500),
                    ),
                    CustomTextField(
                      controller: nameController,
                      hintText: "Name",
                    ),
                    CustomTextField(
                      controller: emailController,
                      hintText: "Email",
                    ),
                    CustomTextField(
                      controller: passwordController,
                      hintText: "Password",
                    ),
                    SizedBox(
                      height: m_h(context) * 0.022,
                    ),
                    AuthButton(
                        title: "Sign up",
                        email: emailController.text,
                        password: passwordController.text,
                        name: nameController.text),
                    SizedBox(
                      height: m_h(context) * 0.003,
                    ),
                    SizedBox(
                      height: m_h(context) * 0.003,
                    ),
                    Text(
                      "or continue with",
                      style: TextStyle(color: Colors.black, fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: m_h(context) * 0.022,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AuthWithButton(
                            title: "Google",
                            image: AppIcons.google,
                            isCreate: true),
                      ],
                    ),
                    SizedBox(
                      height: m_h(context) * 0.022,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(color: Colors.grey, fontSize: 18.sp),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, loginPage);
                            },
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                  color: MyColors.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
