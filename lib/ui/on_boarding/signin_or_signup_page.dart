import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/color.dart';
import '../../utils/constants.dart';
import '../../utils/icons/app_icons.dart';
import '../widgets/global_button_outline.dart';

class SignInOrSignUpScreen extends StatefulWidget {
  const SignInOrSignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignInOrSignUpScreen> createState() => _SignInOrSignUpScreenState();
}

class _SignInOrSignUpScreenState extends State<SignInOrSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.infoBg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: myHeight(context) * 0.059,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 130, left: 40, right: 40).r,
              child: SizedBox(
                height: myHeight(context) * 0.4,
                width: myWidth(context) * 0.4,
                child: Image.asset(AppIcons.logoWithBackground),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90, left: 24, right: 24).r,
              child: Text(
                "Welcome to Shifo top!",
                style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 15, right: 15).r,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    signUpPage,
                    (route) => false,
                  );
                },
                child: Container(
                    width: myWidth(context) * 0.97,
                    height: myHeight(context) * 0.065,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFF0000ff),
                          Color(0xFF0372FE),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30).r,
                    ),
                    child: Center(
                        child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, right: 15, left: 15).r,
              child: GlobalButtonOutline(
                buttonText: 'Sign In',
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, loginPage, (route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
