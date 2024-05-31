import 'package:equatable/equatable.dart';
import 'package:skill_trade/domain/models/booking.dart';

abstract class BookingsState extends Equatable{
  @override
  List<Object?> get props => [];
}

class BookingsLoading extends BookingsState {}

class BookingsLoaded extends BookingsState {
  final List<Booking> bookings;
  BookingsLoaded(this.bookings);
}

class BookingsError extends BookingsState {
  final String error;
  BookingsError(this.error);
}