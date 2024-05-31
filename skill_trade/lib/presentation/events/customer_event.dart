import 'package:equatable/equatable.dart';

abstract class CustomerEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class LoadCustomer extends CustomerEvent {
  final String customerId;

  LoadCustomer({required this.customerId});
}

class LoadAllCustomers extends CustomerEvent {}