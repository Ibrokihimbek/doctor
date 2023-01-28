import 'package:doctor_app/ui/tab_box/history/sub_screen/messages_history_screen.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EditProfileTextfield extends StatelessWidget {
  final TextEditingController textController;
  final String word;
  const EditProfileTextfield({
    super.key,
    required this.word,
    required this.textController
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: width(context) * 0.05),
          child: RichText(
            text: TextSpan(
              text: word,
              style: const TextStyle(
                color: MyColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              children: const [
                TextSpan(
                  text: '*',
                  style: TextStyle(color: MyColors.error, fontSize: 16),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: height(context) * 0.01,
        ),
        Container(
          height: height(context) * 0.066,
          width: width(context),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(-40, 40),
                color: const Color(0xFF93b8EF).withOpacity(0.1),
                spreadRadius: -40,
                blurRadius: 40,
              ),
              BoxShadow(
                offset: const Offset(40, 40),
                color: const Color(0xFF93b8EF).withOpacity(0.1),
                spreadRadius: -40,
                blurRadius: 40,
              ),
            ],
            borderRadius: BorderRadius.circular(height(context) * 0.1),
          ),
          child: TextFormField(
            controller: textController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: word == 'Email'
                ? (email) => email != null && !EmailValidator.validate(email)
                    ? "Enter a valid email"
                    : null
                : word == "Full Name"
                    ? ((value) => value != null && value.length < 2
                        ? "Kamida 2 ta belgi kiriting!"
                        : null)
                    : ((value) => value != null && value.length < 10
                        ? "Kamida 10 ta belgi kiriting!"
                        : null),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: width(context) * 0.06),
              border: InputBorder.none,
              hintText: word,
              hintStyle: const TextStyle(color: MyColors.neutral7),
              helperStyle: const TextStyle(color: Colors.black26),
            ),
          ),
        ),
      ],
    );
  }
}
