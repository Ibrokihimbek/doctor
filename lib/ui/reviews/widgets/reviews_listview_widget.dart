import 'package:doctor_app/data/models/review/review_model.dart';
import 'package:doctor_app/ui/reviews/widgets/review_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ReviewsListViewWidget extends StatelessWidget {
  const ReviewsListViewWidget({Key? key, required this.reviews})
      : super(key: key);

  final List<ReviewModel> reviews;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24).w,
      height: 550.h,
      child: reviews.isNotEmpty
          ? ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                return ReviewItem(
                  image: reviews[index].userImage,
                  name: reviews[index].userName,
                  comment: reviews[index].comment,
                  online: DateFormat.yMMMMd()
                      .format(DateTime.parse(reviews[index].createdAt))
                      .toString(),
                  rating: reviews[index].starCount,
                );
              },
            )
          : Center(
        child: Lottie.asset("assets/lottie/empty_box.json"),
      ),
    );
  }
}
