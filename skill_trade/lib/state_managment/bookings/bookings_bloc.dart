import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:skill_trade/models/booking.dart';
import 'package:skill_trade/state_managment/bookings/bookings_event.dart';
import 'package:skill_trade/state_managment/bookings/bookings_state.dart';

class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  BookingsBloc() : super(BookingsLoading()) {
    on<LoadCustomerBookings>(_onLoadBookings);
    on<PostBooking>(_onPostBookings);
  }

  Future<void> _onLoadBookings(LoadCustomerBookings event, Emitter<BookingsState> emit) async {
    final headers = {"Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImZ1bGxOYW1lIjoiQWJlbmV6ZXIgU2VpZnUiLCJlbWFpbCI6ImFiZW5lemVyc2VpZnUxMjNAZ21haWwuY29tIiwicm9sZSI6ImN1c3RvbWVyIiwiaWF0IjoxNzEzNDY1NjQzLCJleHAiOjE3NDUwMjMyNDN9.lg-0KRLpcLGqE4jRV7wRQBRhI3IHh67v-fDH8bm8Cm8"};
    try {
      final response = await http
          .get(Uri.parse('http://localhost:9000/bookings/customer/1'), headers: headers);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<dynamic> bookingsJson = data["bookings"];
        final bookings = bookingsJson.map((json) => Booking.fromJson(json)).toList();
        emit(BookingsLoaded(bookings));
      } else {
        emit(BookingsError('Error fetching bookings'));
      }
    } catch (error) {
      emit(BookingsError(error.toString()));
    }
  }

  Future<void> _onPostBookings(PostBooking event, Emitter<BookingsState> emit) async {
    final headers = {
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImZ1bGxOYW1lIjoiQWJlbmV6ZXIgU2VpZnUiLCJlbWFpbCI6ImFiZW5lemVyc2VpZnUxMjNAZ21haWwuY29tIiwicm9sZSI6ImN1c3RvbWVyIiwiaWF0IjoxNzEzNDY1NjQzLCJleHAiOjE3NDUwMjMyNDN9.lg-0KRLpcLGqE4jRV7wRQBRhI3IHh67v-fDH8bm8Cm8",
      "Content-Type": "application/json",
    };
    try {
      final response = await http.post(
          Uri.parse('http://localhost:9000/bookings'), 
          headers: headers,
          body: json.encode({
            'customerId': event.customerId,
            'technicianId': event.technicianId,
            'serviceNeeded': event.serviceNeeded,
            "serviceLocation": event.serviceLocation,
            "serviceDate": event.serviceDate,
            "problemDescription": event.problemDescription,
          }),
        );
      if (response.statusCode == 201) {
        print("Posted Booking Successfully");
      } else {
        print("error");
        emit(BookingsError('Error posting bookings'));
      }
    } catch (error) {
      emit(BookingsError(error.toString()));
    }
  }
}