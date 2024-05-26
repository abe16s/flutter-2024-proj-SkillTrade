import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:skill_trade/models/booking.dart';
import 'package:skill_trade/state_managment/bookings/bookings_event.dart';
import 'package:skill_trade/state_managment/bookings/bookings_state.dart';
import 'package:skill_trade/storage.dart';

class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  BookingsBloc() : super(BookingsLoading()) {
    on<LoadCustomerBookings>(_onLoadCustomerBookings);
    on<LoadTechnicianBookings>(_onLoadTechnicianBookings);
    on<PostBooking>(_onPostBookings);
    on<UpdateBooking>(_onUpdateBooking);
    on<DeleteBooking>(_onDeleteBooking);
  }

  String? endpoint;
  String? token;
  String? id;


  Future<void> loadStorage() async {
    endpoint = await SecureStorage.instance.read("endpoint");
    token = await SecureStorage.instance.read("token");
    id = await SecureStorage.instance.read("id");
  }

  Future<void> _onLoadCustomerBookings(LoadCustomerBookings event, Emitter<BookingsState> emit) async {
    await loadStorage();
    final headers = {"Authorization": "Bearer $token"};
    try {
      final response = await http
          .get(Uri.parse('http://$endpoint:9000/bookings/customer/$id'), headers: headers);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<dynamic> bookingsJson = data["bookings"];
        final bookings = bookingsJson.map((json) => Booking.fromJson(json)).toList();
        emit(BookingsLoaded(bookings));
      } else {
        print("fetch error");
        emit(BookingsError('Error fetching bookings'));
      }
    } catch (error) {
      print("error");
      emit(BookingsError(error.toString()));
    }
  }

  Future<void> _onLoadTechnicianBookings(LoadTechnicianBookings event, Emitter<BookingsState> emit) async {
    await loadStorage();
    final headers = {"Authorization": "Bearer $token"};
    try {
      final response = await http
          .get(Uri.parse('http://$endpoint:9000/bookings/technician/$id'), headers: headers);
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
    await loadStorage();
    final headers = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      final response = await http.post(
          Uri.parse('http://$endpoint:9000/bookings'), 
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
        add(LoadCustomerBookings());
      } else {
        print("error");
        print(response.statusCode);
        print(token);
        print('http://$endpoint:9000/bookings');
        print({
            'customerId': event.customerId,
            'technicianId': event.technicianId,
            'serviceNeeded': event.serviceNeeded,
            "serviceLocation": event.serviceLocation,
            "serviceDate": event.serviceDate,
            "problemDescription": event.problemDescription,
          });
        emit(BookingsError('Error posting bookings'));
      }
    } catch (error) {
      emit(BookingsError(error.toString()));
    }
  }

  Future<void> _onUpdateBooking(UpdateBooking event, Emitter<BookingsState> emit) async {
    await loadStorage();
    final headers = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    };
    
    try {
      final response = await http.patch(
          Uri.parse('http://$endpoint:9000/bookings/${event.bookingId}'), 
          headers: headers,
          body: json.encode(event.updates),
        );
      if (response.statusCode == 200) {
        if (event.whoUpdated == "technician") {
          add(LoadTechnicianBookings());
        } else {
          add(LoadCustomerBookings());
        }
        print("Updated Booking Successfully");
      } else {
        print("error");
        emit(BookingsError('Error updating bookings'));
      }
    } catch (error) {
      emit(BookingsError(error.toString()));
    }
  }

  Future<void> _onDeleteBooking(DeleteBooking event, Emitter<BookingsState> emit) async {
    await loadStorage();
    final headers = {"Authorization": "Bearer $token"};
    try {
      final response = await http
          .delete(Uri.parse('http://$endpoint:9000/bookings/${event.bookingId}'), headers: headers);
      
      if (response.statusCode == 200) {
        print("Deleted booking successfully");
        add(LoadCustomerBookings());
      } else {
        emit(BookingsError('Error deleting bookings'));
      }
    } catch (error) {
      emit(BookingsError(error.toString()));
    }
  }
}