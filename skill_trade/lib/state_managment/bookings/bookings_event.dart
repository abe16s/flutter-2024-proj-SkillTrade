abstract class BookingsEvent {}

class LoadCustomerBookings extends BookingsEvent {}

class PostBooking extends BookingsEvent {
  final int customerId;
  final int technicianId;
  final String serviceNeeded;
  final String serviceDate;
  final String serviceLocation;
  final String problemDescription;

  PostBooking({required this.problemDescription, required this.customerId, required this.technicianId, required this.serviceNeeded, required this.serviceDate, required this.serviceLocation});
  List<Object> get props => [customerId, technicianId, serviceNeeded];
}