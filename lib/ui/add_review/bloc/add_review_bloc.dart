import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doctor_app/data/models/review/review_model.dart';
import 'package:doctor_app/data/repositories/review_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'add_review_event.dart';

part 'add_review_state.dart';

class AddReviewBloc extends Bloc<AddReviewEvent, AddReviewState> {
  AddReviewBloc(this.reviewRepository)
      : super(
          const AddReviewState(
            statusText: "",
            isLoading: false,
          ),
        ) {
    on<AddReview>(_addReview);
  }

  final ReviewRepository reviewRepository;

  _addReview(AddReview event, Emitter<AddReviewState> emit) async {
    emit(state.copyWith(isLoading: true));
    var isAdded =
        await reviewRepository.addReview(reviewModel: event.reviewModel);
    if (isAdded) {
      emit(state.copyWith(isLoading: false, statusText: "success"));
    } else {
      emit(state.copyWith(statusText: "error", isLoading: false));
    }
  }
}
