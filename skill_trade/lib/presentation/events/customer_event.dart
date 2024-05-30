abstract class CustomerEvent {}

class LoadCustomer extends CustomerEvent {
  final String customerId;

  LoadCustomer({required this.customerId});
}

class LoadAllCustomers extends CustomerEvent {}