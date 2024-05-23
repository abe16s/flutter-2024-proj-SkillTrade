import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:skill_trade/models/customer.dart';
import 'package:skill_trade/state_managment/customer/customer_event.dart';
import 'package:skill_trade/state_managment/customer/customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerBloc() : super(CustomerLoading()) {
    on<LoadCustomer>(_onLoadCustomer);
  }

  Future<void> _onLoadCustomer(LoadCustomer event, Emitter<CustomerState> emit) async {
    final headers = {"Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImZ1bGxOYW1lIjoiQWJlbmV6ZXIgU2VpZnUiLCJlbWFpbCI6ImFiZW5lemVyc2VpZnUxMjNAZ21haWwuY29tIiwicm9sZSI6ImN1c3RvbWVyIiwiaWF0IjoxNzEzNDY1NjQzLCJleHAiOjE3NDUwMjMyNDN9.lg-0KRLpcLGqE4jRV7wRQBRhI3IHh67v-fDH8bm8Cm8"};
    try {
      final response = await http
          .get(Uri.parse('http://localhost:9000/customer/${event.customerId}'), headers: headers);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final customer = Customer.fromJson(data);
        emit(CustomerLoaded(customer: customer));
      } else {
        emit(CustomerError('Error fetching technician'));
      }
    } catch (error) {
      emit(CustomerError(error.toString()));
    }
  }
}
