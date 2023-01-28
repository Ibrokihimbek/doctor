import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/style.dart';

class AgeWidget extends StatelessWidget {

  final BuildContext context;
   final   int index;
 final Color colorContainer;
   final   Color colorText;

  const AgeWidget({Key? key, required this.context, required this.index, required this.colorContainer, required this.colorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Container(
      margin: const EdgeInsets.only(right: 5, left: 10, top: 20).r,
      height: MediaQuery
          .of(context)
          .size
          .height * 0.03,
      width: MediaQuery
          .of(context)
          .size
          .width * 0.15,
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: MyColors.actionPrimaryDefault,
          ),
          borderRadius: BorderRadius
              .circular(20)
              .w,
          color: colorContainer),
      child: Center(
        child: Text(
          "${index + 1}0+",
          style: MyTextStyle.sfProSemiBold.copyWith(
            fontSize: 16.sp,
            color: colorText,
          ),
        ),
      ),
    );
  }
}
