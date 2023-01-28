import 'package:doctor_app/ui/book_appointment/sub_screens/payment/widgets/card_input_component.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/app_icons.dart';
import 'package:doctor_app/utils/icons/card/card.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardItem extends StatelessWidget {
  const CardItem(
      {Key? key,
      required this.expiryDate,
      required this.cardHolderName,
      required this.cardNumber})
      : super(key: key);
  final String cardHolderName;
  final String expiryDate;
  final ValueChanged<String> cardNumber;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      width: double.infinity,
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width * 380,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.51),
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: MyColors.otherGradient1),
          ),
        ),
        Positioned(child: SvgPicture.asset(CardIcons.cardVector1)),
        Positioned(left: 20.w, child: SvgPicture.asset(CardIcons.cardVector2)),
        Align(
          alignment: Alignment.bottomLeft,
          child: SvgPicture.asset(CardIcons.cardVector3),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: 33.h, left: 34.w, right: 26.w, bottom: 28.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Credit Card",
                style: MyTextStyle.sfProSemiBold
                    .copyWith(fontSize: 16.sp, color: MyColors.white),
              ),
              const Spacer(),
              CardInputComponent(
                  cardText: (cardText) {
                    cardNumber.call(cardText);
                  },
                  initialValue: ''),
              const Spacer(),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Card Holder name",
                        style: MyTextStyle.sfProRegular
                            .copyWith(fontSize: 12.sp, color: MyColors.white),
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      SizedBox(
                        width: 86.w,
                        child: Text(
                          cardHolderName,
                          maxLines: 2,
                          style: MyTextStyle.sfProSemiBold
                              .copyWith(fontSize: 16.sp, color: MyColors.white),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 52.5.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Expiry Date",
                        style: MyTextStyle.sfProRegular
                            .copyWith(fontSize: 12.sp, color: MyColors.white),
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      Text(
                        expiryDate,
                        style: MyTextStyle.sfProSemiBold
                            .copyWith(fontSize: 16.sp, color: MyColors.white),
                      )
                    ],
                  ),
                  const Spacer(),
                  Image.asset(
                    AppIcons.uzCard,
                    height: 10.h,
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
