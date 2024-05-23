import 'package:skill_trade/models/booking.dart';

abstract class BookingsState {}

class BookingsLoading extends BookingsState {}

class BookingsLoaded extends BookingsState {
  final List<Booking> bookings;
  BookingsLoaded(this.bookings);
}

class BookingsError extends BookingsState {
  final String error;
  BookingsError(this.error);
}