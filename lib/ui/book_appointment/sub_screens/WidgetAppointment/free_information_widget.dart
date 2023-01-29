import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FreeInformationWidget extends StatefulWidget {
  final String icon;
  final String name;
  final String description;
  final String price;
  final Color colorIcon;
  final Color colorCon;
  final Color colorPrice;
  final Color colorText;
  final Color colorDescription;

  const FreeInformationWidget(
      {Key? key,
      required this.icon,
      required this.name,
      required this.description,
      required this.price,
      required this.colorIcon,
      required this.colorCon,
      required this.colorPrice,
      required this.colorText,
      required this.colorDescription})
      : super(key: key);

  @override
  State<FreeInformationWidget> createState() => _FreeInformationWidgetState();
}

class _FreeInformationWidgetState extends State<FreeInformationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 15, right: 5, left: 5).r,
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width * 0.90,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff121212).withOpacity(0.1),
            blurRadius: 6
          )
        ],
        borderRadius: BorderRadius.circular(15).w,
        color: widget.colorCon,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.colorIcon,
            ),
            child: Center(
              child: SvgPicture.asset(
                widget.icon,
                color: MyColors.actionPrimaryDefault,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0,right: 4).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.name,
                  style: MyTextStyle.sfProSemiBold.copyWith(
                    fontSize: 20.sp,
                    color: widget.colorText,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                Text(
                  widget.description,
                  style: MyTextStyle.sfProRegular.copyWith(
                    color: widget.colorDescription,
                  ),
                ),
              ],
            ),
          ),
          // const Spacer(),
          Container(
            padding: const EdgeInsets.only(
              right: 20,
            ).r,
            child: Text(
              "${widget.price}",
              style: MyTextStyle.sfProSemiBold.copyWith(
                fontSize: 20.sp,
                color: widget.colorPrice,
              ),
            ),
          )
        ],
      ),
    );
  }
}
