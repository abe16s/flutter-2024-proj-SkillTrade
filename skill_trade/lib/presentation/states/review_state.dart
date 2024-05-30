import 'package:skill_trade/domain/models/review.dart';

abstract class ReviewsState{}

class ReviewsLoading extends ReviewsState {}

class ReviewsLoaded extends ReviewsState {
  final List<Review> review;
  ReviewsLoaded(this.review);
}

class ReviewsError extends ReviewsState {
  final String error;
  ReviewsError(this.error);
}