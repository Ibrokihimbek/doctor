import 'dart:io';

import 'package:doctor_app/data/models/users/user_model.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/editor/editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class UpdateImage extends StatelessWidget {
  final UserModel userModel;
  final VoidCallback onTap;
  final XFile? imageUrl;
  const UpdateImage({
    super.key,
    required this.onTap,
    this.imageUrl,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 120.0),
          child: Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: imageUrl != null
                  ? DecorationImage(
                      image: FileImage(
                        File(imageUrl!.path),
                      ),fit: BoxFit.cover
                    )
                  : DecorationImage(
                      image: NetworkImage(
                        userModel.imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
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
              child: InkWell(
                onTap: onTap,
                child: SvgPicture.asset(
                  EditorIcons.mode,
                  width: 13.3.w,
                  height: 13.3.h,
                  color: MyColors.neutralWhite,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
