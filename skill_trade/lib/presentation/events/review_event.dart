import 'package:equatable/equatable.dart';

abstract class ReviewsEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class LoadTechnicianReviews extends ReviewsEvent {
  final int technicianId;

  LoadTechnicianReviews({required this.technicianId});
}

class PostReview extends ReviewsEvent {
  final int technicianId;
  final String review;
  final int rate;
  final int customerId;

  PostReview({required this.technicianId, required this.review, required this.rate, required this.customerId});
}

class UpdateReview extends ReviewsEvent {
  final Map<String, dynamic> updates;
  final int reviewId;
  final int technicianId;

  UpdateReview({required this.updates, required this.reviewId, required this.technicianId});
}

class DeleteReview extends ReviewsEvent {
  final int reviewId;
  final int technicianId;

  DeleteReview({required this.reviewId, required this.technicianId});
}
