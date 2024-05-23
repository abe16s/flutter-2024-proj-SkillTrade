import 'package:skill_trade/models/customer.dart';

abstract class CustomerState {}

class CustomerLoading extends CustomerState {}

class CustomerLoaded extends CustomerState {
  final Customer customer;

  CustomerLoaded({required this.customer});
}


class CustomerError extends CustomerState {
  final String error;

  CustomerError(this.error);
}