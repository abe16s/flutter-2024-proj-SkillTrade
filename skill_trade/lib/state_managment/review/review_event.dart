abstract class ReviewsEvent {}

class LoadTechnicianReviews extends ReviewsEvent {
  final int technicianId;

  LoadTechnicianReviews({required this.technicianId});
}

class PostReview extends ReviewsEvent {
  final int technicianId;
  final String review;
  final int rate;

  PostReview({required this.technicianId, required this.review, required this.rate});
}

class UpdateReview extends ReviewsEvent {
  final Map<String, dynamic> updates;
  final int reviewId;

  UpdateReview({required this.updates, required this.reviewId,});
}

class DeleteReview extends ReviewsEvent {
  final int reviewId;

  DeleteReview({required this.reviewId});
}
