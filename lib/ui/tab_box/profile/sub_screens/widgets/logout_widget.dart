import 'package:doctor_app/data/repositories/storage_repository.dart';
import 'package:doctor_app/ui/widgets/chip_text_button_outline.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:doctor_app/utils/icons/action/action.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 284.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
        color: MyColors.neutralWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 48).r,
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset(
                ActionIcons.exitToApp,
                width: 48.w,
                height: 48.h,
                color: MyColors.primary,
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
               tr( "for_logout.are_you_sure_want_to_logout?"),
                style: MyTextStyle.sfProMedium.copyWith(fontSize: 16.sp),
              ),
              SizedBox(height: 37.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w).r,
                child: Row(
                  children: [
                    ChipTextButtonOutline(
                      isActive: false,
                      pageIndex: 0,
                      buttonText:tr('for_logout.cancel'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Spacer(),
                    ChipTextButtonOutline(
                      isActive: true,
                      onTap: () {
                        StorageRepository.logOut();
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          signInOrSignUp,
                          (route) => false,
                        );

                        FirebaseAuth.instance.signOut();
                      },
                      buttonText: tr('for_logout.yes,_logout'),
                      pageIndex: 0,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
