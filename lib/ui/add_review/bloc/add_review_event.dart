part of 'add_review_bloc.dart';

@immutable
abstract class AddReviewEvent {}

class AddReview extends AddReviewEvent {
  AddReview({required this.reviewModel});
  final ReviewModel reviewModel;
}

