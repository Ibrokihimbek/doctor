import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CardInputComponent extends StatefulWidget {
  const CardInputComponent(
      {Key? key,
        required this.cardText,
        required this.initialValue})
      : super(key: key);

  final ValueChanged<String> cardText;
  final String initialValue;

  @override
  State<CardInputComponent> createState() => _CardInputComponentState();
}

class _CardInputComponentState extends State<CardInputComponent> {
  late MaskTextInputFormatter cardMaskInputFormatter;
  final FocusNode cardFocusNode = FocusNode();
  final TextEditingController controller = TextEditingController();
  @override
  void initState(){
    cardMaskInputFormatter = MaskTextInputFormatter(
      mask: '#### #### #### ####',
      filter: {
        '#': RegExp(r'[0-9]'),
      },
    );
    controller.text = cardMaskInputFormatter.maskText(widget.initialValue);
    super.initState();
  }
  @override
  void dispose(){
    cardFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      inputFormatters: [cardMaskInputFormatter],
      keyboardType:const TextInputType.numberWithOptions(
        signed: false,
        decimal: true
      ),
      cursorColor: MyColors.white,
      focusNode: cardFocusNode,
      onChanged: (String value){
        setState(() {
          if(value.length==19){
            cardFocusNode.unfocus();
          }
          widget.cardText.call(value);
        });
      },
      style: MyTextStyle.sfProSemiBold.copyWith(
        fontSize: 27.sp,
        color: MyColors.white
      ),
      decoration: InputDecoration(
        hintStyle: MyTextStyle.sfProSemiBold.copyWith(
          fontSize: 27.sp,
          color: MyColors.white.withOpacity(0.5)
        ),
        hintText: "Card Number",
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        border: InputBorder.none
      ),
    );
  }
}


