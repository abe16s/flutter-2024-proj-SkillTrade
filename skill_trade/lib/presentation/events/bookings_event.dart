abstract class BookingsEvent {}

class LoadCustomerBookings extends BookingsEvent {
  final String customerId;

  LoadCustomerBookings({required this.customerId});
}

class LoadTechnicianBookings extends BookingsEvent {
  final String technicianId;

  LoadTechnicianBookings({required this.technicianId});
}

class PostBooking extends BookingsEvent {
  final int? customerId;
  final int technicianId;
  final String serviceNeeded;
  final DateTime serviceDate;
  final String serviceLocation;
  final String problemDescription;

  PostBooking({required this.problemDescription, required this.customerId, required this.technicianId, required this.serviceNeeded, required this.serviceDate, required this.serviceLocation});
  List<dynamic> get props => [customerId, technicianId, serviceNeeded];
}

class UpdateBooking extends BookingsEvent {
  final Map<String, dynamic> updates;
  final int bookingId;
  final String whoUpdated;
  final String updaterId;

  UpdateBooking({required this.updates, required this.bookingId, required this.whoUpdated, required this.updaterId,});
}

class DeleteBooking extends BookingsEvent {
  final int bookingId;
  final int customerId;

  DeleteBooking({required this.bookingId, required this.customerId,});
}
