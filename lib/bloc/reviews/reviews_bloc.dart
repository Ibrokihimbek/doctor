import 'package:doctor_app/bloc/reviews/reviews_state.dart';
import 'package:doctor_app/data/repositories/review_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewsBloc extends Cubit<ReviewsState> {
  ReviewsBloc(
    this.reviewRepository,
  ) : super(InitialReviewsState()) {
    // on<GetReviews>(_getReview);
    _fetchReviewsInfo();
  }

  final ReviewRepository reviewRepository;

  // _getReview(GetReviews event, Emitter<ReviewsState> emit) {
  //   reviewRepository.getReviews().listen((reviews) {
  //     emit(LoadReviewsInSuccess(reviews: reviews));
  //   });
  // }

  _fetchReviewsInfo() async {
    emit(LoadReviewsInProgress());
    reviewRepository.getReviews().listen((reviews) {
      emit(LoadReviewsInSuccess(reviews: reviews));
    });
  }
}
