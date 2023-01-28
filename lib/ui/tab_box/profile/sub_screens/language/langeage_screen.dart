import 'package:doctor_app/ui/widgets/custom_appbar.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/action/action.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String activeLanguage = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: tr("profile_screen.language"),
        widget: const SizedBox(),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: MyColors.white,
        padding: EdgeInsets.symmetric(horizontal: 24.h).r,
        child: Column(
          children: [
            languageContainer("english", () {
              if (activeLanguage != "en-EN") {
                setState(() {
                  context.setLocale(
                    const Locale('en', 'EN'),
                  );
                  activeLanguage = "en-EN";
                });
              }
            }, activeLanguage == "en-EN"),
            const Divider(
              thickness: 1,
              color: MyColors.neutral8,
            ),
            languageContainer("russian", () {
              if (activeLanguage != "ru-RU") {
                setState(() {
                  context.setLocale(
                    const Locale('ru', 'RU'),
                  );
                  activeLanguage = "ru-RU";
                });
              }
            }, activeLanguage == "ru-RU"),
            const Divider(
              color: MyColors.neutral8,
              thickness: 1,
            ),
            languageContainer("uzbek", () {
              if (activeLanguage != "uz-UZ") {
                setState(() {
                  context.setLocale(
                    const Locale('uz', 'UZ'),
                  );
                  activeLanguage = "uz-UZ";
                });
              }
            }, activeLanguage == "uz-UZ"),
          ],
        ),
      ),
    );
  }

  Widget languageContainer(String text, VoidCallback onTap, bool isTrue) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tr('language_screen.$text'),
              style: TextStyle(
                  color: MyColors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
            isTrue
                ? Container(
                    height: 44.h,
                    width: 44.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: MyColors.primary.withOpacity(0.1),
                    ),
                    child: Center(
                      child: SvgPicture.asset(ActionIcons.checkCircleOutline,
                          color: MyColors.primary, width: 24.w, height: 24.h),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
