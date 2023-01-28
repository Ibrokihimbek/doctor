import 'package:doctor_app/bloc/auth/auth_bloc.dart';
import 'package:doctor_app/ui/auth/widgets/animated_snackbar.dart';
import 'package:doctor_app/ui/widgets/widgets.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../utils/color.dart';

class AuthWithButton extends StatelessWidget {
  String title;
  String image;
  bool isCreate;
   AuthWithButton({required this.title,required this.image,required this.isCreate,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () async {
        String? fcmToken = await FirebaseMessaging.instance.getToken();
        if(title=="Google"){
          // ignore: use_build_context_synchronously
          context.read<AuthBloc>().add(CreateUserWithGoogle(fcmToken:fcmToken??"",isCreate: isCreate));
        }else{
          // ignore: use_build_context_synchronously
          MySnackBar(context, notification: "Sign In with Facebook is not available", color: Colors.red, icon: Icon(Icons.info,color: Colors.white,));
        }
      },
      child: Container(
        height: m_h(context)*0.064,
        width: m_h(context)*0.18,
        decoration: BoxDecoration(
            border: Border.all(color: MyColors.neutral1.withOpacity(0.07)),
            borderRadius: BorderRadius.circular(m_h(context)*0.016)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(image,width: m_h(context)*0.03,),
             Text(title,style:   TextStyle(color: MyColors.neutralBlack,fontWeight: FontWeight.w600,fontSize: 18.sp),)
          ],
        ),
      ),
    )
    ;
  }
}
