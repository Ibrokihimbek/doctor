import 'package:doctor_app/bloc/reviews/reviews_bloc.dart';
import 'package:doctor_app/bloc/reviews/reviews_state.dart';
import 'package:doctor_app/data/models/review/review_model.dart';
import 'package:doctor_app/ui/reviews/widgets/reviews_listview_widget.dart';
import 'package:doctor_app/ui/reviews/widgets/review_item.dart';
import 'package:doctor_app/ui/reviews/widgets/star_rate_item.dart';
import 'package:doctor_app/ui/widgets/global_button_outline.dart';
import 'package:doctor_app/ui/widgets/single_icon_appbar.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/content/content.dart';
import 'package:doctor_app/utils/icons/social/social.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key, required this.reviews});

  final List<ReviewModel> reviews;

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

List starCounts = ["All", 5, 4, 3, 2, 1];

int selectStar = 0;

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsBloc, ReviewsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: MyColors.white,
          appBar: SingleIconAppBar(
            title: "reviews".tr(),
            svgIcon: ContentIcons.filterList,
            onTap: () {},
          ),
          body: Column(
            children: [
              SizedBox(height: 28.5.h),
              SizedBox(
                height: 36.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 24, right: 12).w,
                  itemCount: starCounts.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectStar = index;
                        });
                      },
                      child: StarRate(
                        rate: starCounts[index].toString(),
                        isActive: selectStar == index ? true : false,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24.h),
              ReviewsListViewWidget(
                  reviews: selectStar == 0
                      ? widget.reviews.toList()
                      : widget.reviews
                          .where((element) =>
                              element.starCount == starCounts[selectStar])
                          .toList()),
              SizedBox(height: 60.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24).w,
                child: GlobalButtonOutline(
                  buttonText: "back".tr(),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
