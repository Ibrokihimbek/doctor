import 'package:doctor_app/ui/auth/bloc/validate_bloc.dart';
import 'package:doctor_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  CustomTextField({required this.controller, required this.hintText, Key? key})
      : super(key: key);

  Icon emailIcon= const Icon(Icons.email,color: Colors.transparent,);
  Icon passwordIcon= const Icon(Icons.password,color: Colors.transparent,);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidateBloc,ValidatingStatusState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: m_h(context)*0.022,
            ),
            Row(
              children: [
                SizedBox(
                  width: m_h(context)*0.022,
                ),
                RichText(text:  TextSpan(children: [
                  TextSpan(text: hintText,style:  TextStyle(color: Colors.black..withOpacity(0.80),fontSize: 18.sp,fontWeight: FontWeight.w600)),
                  TextSpan(text: "*",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w600,fontSize: 18.sp)),
                ])),
              ],
            ),
            SizedBox(
              height: m_h(context)*0.015,
            ),
            Container(
                height: m_h(context)*0.06,
                width: m_w(context),
                padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.02),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * 0.022)),
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            if(hintText=="Email"){
                              context.read<ValidateBloc>().add(ValidatingEmailEvent(email:value));
                            }else if(hintText=="Password"){
                              context.read<ValidateBloc>().add(ValidatingPasswordEvent(password:value));
                            }
                          },
                          onSubmitted: (value){
                            if(hintText=="Email"){
                              context.read<ValidateBloc>().add(ValidatingEmailEvent(email:value));
                            }else if(hintText=="Password"){
                              context.read<ValidateBloc>().add(ValidatingPasswordEvent(password:value));
                            }
                          },
                          controller: controller,
                          decoration:
                          InputDecoration(hintText: hintText, border: InputBorder.none),
                        ),
                      ),
                      hintText=="Email"?state.emailValidated?Icon(Icons.verified,color: Colors.green,):Icon(Icons.cancel_outlined,color: Colors.red,):
                      hintText=="Password"?state.passwordValidated?Icon(Icons.verified,color: Colors.green,):Icon(Icons.cancel_outlined,color: Colors.red,):
                      Icon(Icons.add,color: Colors.transparent,),
                      const SizedBox(width: 16,),
                    ],
                  )
                )),
          ],
        );
      },

    );
  }
}
