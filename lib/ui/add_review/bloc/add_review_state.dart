part of 'add_review_bloc.dart';

class AddReviewState extends Equatable {
  const AddReviewState({

    required this.statusText,
    required this.isLoading,
  });

  final String statusText;
  final bool isLoading;

  AddReviewState copyWith({
    ReviewModel? reviewModel,
    String? statusText,
    bool? isLoading,
  }) =>
      AddReviewState(
        isLoading: isLoading ?? this.isLoading,
        statusText: statusText ?? this.statusText,
      );

  @override
  List<Object> get props => [
        isLoading,
        statusText,
      ];
}
