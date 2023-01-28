import 'package:doctor_app/ui/book_appointment/sub_screens/payment/widgets/card_expire_date_component.dart';
import 'package:doctor_app/ui/book_appointment/sub_screens/payment/widgets/card_item.dart';
import 'package:doctor_app/ui/book_appointment/sub_screens/payment/widgets/success_booking_dialog.dart';
import 'package:doctor_app/ui/widgets/global_button.dart';
import 'package:doctor_app/ui/widgets/single_icon_appbar.dart';
import 'package:doctor_app/ui/widgets/text_field.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/app_icons.dart';
import 'package:doctor_app/utils/icons/content/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingPaymentScreen extends StatefulWidget {
  const BookingPaymentScreen({Key? key}) : super(key: key);

  @override
  State<BookingPaymentScreen> createState() => _BookingPaymentScreenState();
}

TextEditingController fullNameController = TextEditingController();
String expiryDate = '';
String cardNumber = '';

class _BookingPaymentScreenState extends State<BookingPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: SingleIconAppBar(
        onTap: () {},
        title: 'Payment',
        svgIcon: ContentIcons.addCircleOutline,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0).r,
          child: Column(
            children: [
              CardItem(
                cardHolderName: fullNameController.text,
                expiryDate: expiryDate,
                cardNumber: (cardNum) {
                  cardNumber = cardNum;
                  setState(() {});
                },
              ),
              SizedBox(
                height: 24.h,
              ),
              MyTextField(
                onChanged: (v) {
                  setState(() {});
                },
                controller: fullNameController,
                text: 'Full name',
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 110.0).r,
                child: CardInputExpiryDate(
                    cardExpiryDate: (cardExpiryDate) {
                      setState(() {
                        expiryDate = cardExpiryDate;
                      });
                    },
                    initialValue: ''),
              ),
              SizedBox(
                height: 132.h,
              ),
              SizedBox(
                width: 380.w,
                child: GlobalButton(
                  isActive: expiryDate.length == 5 &&
                      cardNumber.length == 19 &&
                      fullNameController.text != '',
                  buttonText: 'Pay Now',
                  onTap: () {
                    // SuccessDialog(
                    //     context: context,
                    //     imagePath: AppIcons.message,
                    //     desc: "Your appointment booking successfully  \n    "
                    //         "   completed. Dr. Jenny Wilson will    \n               "
                    //         "       Message you soon.");
                    ErrorDialog(
                        context: context,
                        imagePath: AppIcons.phoneCallFailed,
                        desc: " Please make sure that your internet \n"
                            "connection is active and stable, then  \n         "
                            "         press “Try Again”");
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
