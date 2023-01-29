import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/av/av.dart';
import 'package:doctor_app/utils/icons/communication/communication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageWithStack extends StatelessWidget {
  const ImageWithStack({super.key, required this.imgName, required this.type});
  final String imgName;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff7DE5ED)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.r),
              bottomLeft: Radius.circular(50.r),
            ),
            child: Image.network(
              imgName,
              height: 80.h,
              width: 80.w,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 62.h,
          left: 62.w,
          child: Container(
            width: 46.w,
            height: 46.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
              ),
            ),
          ),
        ),
        Positioned(
          top: 64.h,
          left: 64.w,
          child: Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: MyColors.otherGradient1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                type == "Messaging"
                    ? CommunicationIcons.chat
                    : CommunicationIcons.call,
                color: MyColors.neutralWhite,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
