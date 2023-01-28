import 'package:doctor_app/data/models/review/review_model.dart';

abstract class ReviewsState {}

class InitialReviewsState extends ReviewsState {}

class LoadReviewsInProgress extends ReviewsState {}

class LoadReviewsInSuccess extends ReviewsState {
  LoadReviewsInSuccess({required this.reviews});

  final List<ReviewModel> reviews;
}

class LoadReviewsInFailure extends ReviewsState {
  LoadReviewsInFailure({required this.error});

  String error;
}