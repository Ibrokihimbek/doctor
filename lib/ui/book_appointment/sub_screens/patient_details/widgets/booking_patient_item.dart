import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneInputComponent extends StatefulWidget {
  const PhoneInputComponent({
    Key? key,
    required this.onChanged,
    required this.initialValue,
  }) : super(key: key);

  final ValueChanged<String> onChanged;
  final String initialValue;

  @override
  State<PhoneInputComponent> createState() => _PhoneInputComponentState();
}

class _PhoneInputComponentState extends State<PhoneInputComponent> {
  late MaskTextInputFormatter phoneMaskFormatter;
  final FocusNode phoneFocusNode = FocusNode();
  final TextEditingController controller = TextEditingController();
  String shadowText = "90 123-45-67";

  String updateShadowText(String currentText) {
    shadowText = "90 123-45-67";
    shadowText = shadowText.substring(currentText.length, shadowText.length);
    return currentText + shadowText;
  }

  @override
  void initState() {
    phoneMaskFormatter = MaskTextInputFormatter(
      mask: '## ###-##-##',
      filter: {
        "#": RegExp(r'[0-9]'),
      },
    );
    controller.text = phoneMaskFormatter.maskText(widget.initialValue);
    updateShadowText(widget.initialValue);
    super.initState();
  }

  @override
  void dispose() {
    phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          Text(tr('patient_details_screen.phone_number'),
              style: MyTextStyle.sfProSemiBold.copyWith(
                  color: MyColors.neutral1.withOpacity(0.8), fontSize: 16)),
          Text("*",
              style: MyTextStyle.sfProBold.copyWith(color: MyColors.error)),
        ],
      ),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Material(
          borderRadius: BorderRadius.circular(30),
          shadowColor: Colors.blue.withOpacity(0.12),
          elevation: 25,
          child: TextField(
            controller: controller,
            inputFormatters: [phoneMaskFormatter],
            keyboardType: const TextInputType.numberWithOptions(
                signed: false, decimal: true),
            cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
            cursorHeight: 22,
            focusNode: phoneFocusNode,
            onChanged: (String value) {
              setState(() {
                if (value.length == 12) {
                  phoneFocusNode.unfocus();
                }
                widget.onChanged.call(value);
                shadowText = updateShadowText(value);
              });
            },
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15).r,
                child: Text("+998   ",
                    style: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.w700)),
              ),
              hintText: "90 123-45-67",
              contentPadding: const EdgeInsets.only(left: 20),
              hintStyle: TextStyle(color: Colors.grey, fontSize: 20.sp),
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
          ),
        ),
      ),
    ]);
  }
}
