import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:skill_trade/models/review.dart';
import 'package:skill_trade/state_managment/review/review_event.dart';
import 'package:skill_trade/state_managment/review/review_state.dart';
import 'package:skill_trade/storage.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  ReviewsBloc() : super(ReviewsLoading()) {
    on<LoadTechnicianReviews>(_onLoadTechnicianReviews);
    on<PostReview>(_onPostReviews);
    on<UpdateReview>(_onUpdateReview);
    on<DeleteReview>(_onDeleteReview);
  }

  String? endpoint;
  String? token;
  String? id;

  int? technicianId;

  Future<void> loadStorage() async {
    endpoint = await SecureStorage.instance.read("endpoint");
    token = await SecureStorage.instance.read("token");
    id = await SecureStorage.instance.read("id");
  }


  Future<void> _onLoadTechnicianReviews(LoadTechnicianReviews event, Emitter<ReviewsState> emit) async {
    await loadStorage();
    technicianId = event.technicianId;
    final headers = {"Authorization": "Bearer $token"};
    try {
      final response = await http
          .get(Uri.parse('http://$endpoint:9000/review-rate/technician/${event.technicianId}'), headers: headers);
      if (response.statusCode == 200) {
        final  List<dynamic> data = jsonDecode(response.body);
        // final List<dynamic> reviewsJson = data["reviews"];
        final reviews = data.map((json) {
          Map<String, dynamic> cur = {
            "rate": json["rate"],
            "review": json["review"],
            "user": json["user"]["fullName"],
            "userId": json["user"]["id"],
            "id": json["id"]
          };
          return Review.fromJson(cur);
        }).toList();
        print(reviews);
        emit(ReviewsLoaded(reviews));
      } else {
        emit(ReviewsError('Error fetching reviews'));
      }
    } catch (error) {
      emit(ReviewsError(error.toString()));
    }
  }

  Future<void> _onPostReviews(PostReview event, Emitter<ReviewsState> emit) async {
    await loadStorage();
    final headers = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      final response = await http.post(
          Uri.parse('http://$endpoint:9000/review-rate/technician/${event.technicianId}'), 
          headers: headers,
          body: json.encode({
            "customerId": int.tryParse(id!),
            "technicianId": event.technicianId,
            "rate": event.rate,
            "review": event.review
          }),
        );
      if (response.statusCode == 201) {
        print("Posted Review Successfully");
        add(LoadTechnicianReviews(technicianId: event.technicianId));
      } else {
        print("http://$endpoint:9000/review-rate/technician/${event.technicianId}");
        print({
            "customerId": id,
            "technicianId": event.technicianId,
            "rate": event.rate,
            "review": event.review
          });
        print("error");
        emit(ReviewsError('Error posting reviews'));
      }
    } catch (error) {
      emit(ReviewsError(error.toString()));
    }
  }

  Future<void> _onUpdateReview(UpdateReview event, Emitter<ReviewsState> emit) async {
    await loadStorage();
    final headers = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    };
    
    try {
      final response = await http.patch(
          Uri.parse('http://$endpoint:9000/review-rate/${event.reviewId}'), 
          headers: headers,
          body: json.encode(event.updates),
        );
      if (response.statusCode == 200) {
        // add(LoadTechnicianReviews(technicianId: event.technicianId));
        print("Updated Review Successfully");
        add(LoadTechnicianReviews(technicianId: technicianId!));
      } else {
        print("error");
        emit(ReviewsError('Error updating reviews'));
      }
    } catch (error) {
      emit(ReviewsError(error.toString()));
    }
  }

  Future<void> _onDeleteReview(DeleteReview event, Emitter<ReviewsState> emit) async {
    await loadStorage();
    final headers = {"Authorization": "Bearer $token"};
    try {
      final response = await http
          .delete(Uri.parse('http://$endpoint:9000/review-rate/${event.reviewId}'), headers: headers);
      
      if (response.statusCode == 200) {
        print("Deleted review successfully");
        add(LoadTechnicianReviews(technicianId: technicianId!));
      } else {
        emit(ReviewsError('Error deleting reviews'));
      }
    } catch (error) {
      emit(ReviewsError(error.toString()));
    }
  }
}