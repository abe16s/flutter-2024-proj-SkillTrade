abstract class CustomerEvent {}

class LoadCustomer extends CustomerEvent {
  final int customerId;

  LoadCustomer({required this.customerId});
}
