import 'package:equatable/equatable.dart';
import 'package:skill_trade/domain/models/customer.dart';

abstract class CustomerState extends Equatable{
  @override
  List<Object?> get props => [];
}

class CustomerLoading extends CustomerState {}

class CustomerLoaded extends CustomerState {
  final Customer customer;

  CustomerLoaded({required this.customer});
}

class AllCustomersLoaded extends CustomerState {
  final List<Customer> customers;

  AllCustomersLoaded(this.customers);
}


class CustomerError extends CustomerState {
  final String error;

  CustomerError(this.error);
}