import 'package:doctor_app/bloc/user/user_bloc.dart';
import 'package:doctor_app/ui/tab_box/profile/sub_screens/widgets/logout_widget.dart';
import 'package:doctor_app/ui/tab_box/profile/sub_screens/widgets/profile_item.dart';
import 'package:doctor_app/ui/widgets/appbar_by_logo.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:doctor_app/utils/icons/action/action.dart';
import 'package:doctor_app/utils/icons/app_icons.dart';
import 'package:doctor_app/utils/icons/editor/editor.dart';
import 'package:doctor_app/utils/icons/image/image.dart';
import 'package:doctor_app/utils/icons/social/social.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserSingleState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: MyColors.white,
        appBar: AppbarByLogo(
          logo: AppIcons.logo,
          title: 'Profil',
          onAddTap: () {
            Navigator.pushNamed(
              context,
              profileEditRoute,
              arguments: {'userModel': state.userModel},
            );
          },
          rightLogo: ImageIcons.edit,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 100.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: state.userModel.imageUrl.isEmpty
                                ? const DecorationImage(
                              image: AssetImage(ImageIcons.userImage),
                            )
                                : DecorationImage(
                              image: NetworkImage(
                                state.userModel.imageUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 3.r,
                          right: 5.r,
                          child: Container(
                            width: 22.w,
                            height: 22.h,
                            decoration: const BoxDecoration(
                              color: MyColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                EditorIcons.mode,
                                width: 13.3.w,
                                height: 13.3.h,
                                color: MyColors.neutralWhite,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 27.33.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.userModel.fullName,
                          style: MyTextStyle.sfProSemiBold.copyWith(
                              fontSize: 23.sp, color: MyColors.neutralBlack),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          state.userModel.email,
                          style: MyTextStyle.sfProRegular.copyWith(
                              fontSize: 16.sp, color: MyColors.neutral3),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          state.userModel.address,
                          style: MyTextStyle.sfProRegular.copyWith(
                              fontSize: 16.sp, color: MyColors.neutral3),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 24.h),
                const Divider(thickness: 1),
                SizedBox(height: 24.h),
                profileItem(
                  onTap: () {
                    Navigator.pushNamed(context, settingsNotif);
                  },
                  text: "notification",
                  iconName: SocialIcons.notification,
                ),
                SizedBox(height: 16.h),
                const Divider(thickness: 1),
                SizedBox(height: 16.h),
                profileItem(
                  onTap: () {
                    Navigator.pushNamed(context, settingsSecure);
                  },
                  text: "security",
                  iconName: ActionIcons.lock,
                ),
                SizedBox(height: 16.h),
                const Divider(thickness: 1),
                SizedBox(height: 16.h),
                profileItem(
                    text: "language",
                    iconName: ActionIcons.language,
                    onTap: () {
                      Navigator.pushNamed(context, languageRoute);
                    }),
                SizedBox(height: 16.h),
                const Divider(thickness: 1),
                SizedBox(height: 16.h),
                profileItem(
                  onTap: () {
                    Navigator.pushNamed(context, settingsAppear);
                  },
                  text: "appearance",
                  iconName: ActionIcons.visibility,
                ),
                SizedBox(height: 16.h),
                const Divider(thickness: 1),
                SizedBox(height: 16.h),
                profileItem(
                  onTap: () {
                    Navigator.pushNamed(context, helpRoute);
                  },
                  text: "help",
                  iconName: ActionIcons.info,
                ),
                SizedBox(height: 16.h),
                const Divider(thickness: 1),
                SizedBox(height: 16.h),
                profileItem(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return const LogoutWidget();
                      },
                    );
                  },
                  text: "logout",
                  iconName: ActionIcons.exitToApp,
                ),
                SizedBox(
                  height: 66.h,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}