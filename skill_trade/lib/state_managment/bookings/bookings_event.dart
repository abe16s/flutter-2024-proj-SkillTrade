abstract class BookingsEvent {}

class LoadCustomerBookings extends BookingsEvent {}

class LoadTechnicianBookings extends BookingsEvent {}

class PostBooking extends BookingsEvent {
  final int? customerId;
  final int technicianId;
  final String serviceNeeded;
  final String serviceDate;
  final String serviceLocation;
  final String problemDescription;

  PostBooking({required this.problemDescription, required this.customerId, required this.technicianId, required this.serviceNeeded, required this.serviceDate, required this.serviceLocation});
  List<dynamic> get props => [customerId, technicianId, serviceNeeded];
}

class UpdateBooking extends BookingsEvent {
  final Map<String, dynamic> updates;
  final int bookingId;
  final String whoUpdated;

  UpdateBooking({required this.updates, required this.bookingId, required this.whoUpdated});
}

class DeleteBooking extends BookingsEvent {
  final int bookingId;

  DeleteBooking({required this.bookingId});
}
