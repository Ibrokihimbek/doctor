import 'dart:io';

import 'package:doctor_app/data/models/users/user_model.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/file/file.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatelessWidget {
  final UserModel userModel;
  final XFile? imageUrl;
  final VoidCallback onTap;
  const UploadImage({
    super.key,
    required this.userModel,
    required this.onTap,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? Center(
            child: Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: FileImage(
                    File(imageUrl!.path),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        : Container(
            width: 380.w,
            height: 121.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: Colors.grey),
              color: Colors.transparent,
            ),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                InkWell(
                  onTap: onTap,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyColors.primary.withOpacity(0.10),
                    ),
                    width: 60.w,
                    height: 60.h,
                    child: Center(
                      child: SvgPicture.asset(
                        FileIcons.cloudUpload,
                        color: MyColors.primary,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Upload Photo Profile',
                  style: MyTextStyle.sfProSemiBold
                      .copyWith(fontSize: 14.sp, color: MyColors.neutral6),
                )
              ],
            ),
          );
  }
}
