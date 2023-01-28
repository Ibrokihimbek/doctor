import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/notification/notification.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
class CardInputExpiryDate extends StatefulWidget {
  const CardInputExpiryDate(
      {Key? key,
        required this.cardExpiryDate,
        required this.initialValue})
      : super(key: key);

  final ValueChanged<String> cardExpiryDate;
  final String initialValue;

  @override
  _CardInputExpiryDateState createState() => _CardInputExpiryDateState();
}

class _CardInputExpiryDateState extends State<CardInputExpiryDate> {
  late MaskTextInputFormatter cardMaskInputFormatterExpiry;
  final TextEditingController controller = TextEditingController();
  @override
  void initState(){
    cardMaskInputFormatterExpiry = MaskTextInputFormatter(
      mask: '##/##',
      filter: {
        '#': RegExp(r'[0-9]'),
      },
    );
    controller.text = cardMaskInputFormatterExpiry.maskText(widget.initialValue);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 264.w,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              Text('Expiry Date', style: MyTextStyle.sfProSemiBold.copyWith(color: MyColors.neutral1.withOpacity(0.8), fontSize: 16)),
              Text("*", style: MyTextStyle.sfProBold.copyWith(color: MyColors.error)),
            ],
          ),
          const SizedBox(height: 10),
          Material(
            borderRadius: BorderRadius.circular(30),
            shadowColor: Colors.blue.withOpacity(0.12),
            elevation: 25,
            child: TextFormField(
              inputFormatters: [cardMaskInputFormatterExpiry],
              onChanged: (v){
                if(v.length==5){
                  widget.cardExpiryDate.call(v);
                }
              },
              style: MyTextStyle.sfProSemiBold.copyWith(color: MyColors.neutralBlack, fontWeight: FontWeight.w600, fontSize: 16),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: validator,
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Expiry Date',
                contentPadding: const EdgeInsets.only(left: 20),
                hintStyle: MyTextStyle.sfProSemiBold.copyWith(color: MyColors.neutral7, fontSize: 16),
                suffixIcon:
                SvgPicture.asset(NotificationIcons.eventNote,color: Colors.grey,height: 5, width: 5, fit: BoxFit.scaleDown),
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: MyColors.neutral8),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: MyColors.primary, width: 2),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  borderSide: BorderSide(color: MyColors.error),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  borderSide: BorderSide(color: MyColors.error),
                ),
              ),
              cursorColor: MyColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}