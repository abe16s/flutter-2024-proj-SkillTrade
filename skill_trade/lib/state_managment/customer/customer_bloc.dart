import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:skill_trade/models/customer.dart';
import 'package:skill_trade/state_managment/customer/customer_event.dart';
import 'package:skill_trade/state_managment/customer/customer_state.dart';
import 'package:skill_trade/storage.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerBloc() : super(CustomerLoading()) {
    on<LoadCustomer>(_onLoadCustomer);
  }

  String? endpoint;
  String? token;
  String? id;


  Future<void> loadStorage() async {
    endpoint = await SecureStorage.instance.read("endpoint");
    token = await SecureStorage.instance.read("token");
    id = await SecureStorage.instance.read("id");
  }

  Future<void> _onLoadCustomer(LoadCustomer event, Emitter<CustomerState> emit) async {
    await loadStorage();
    final headers = {"Authorization": "Bearer $token"};
    try {
      final response = await http
          .get(Uri.parse('http://$endpoint:9000/customer/${event.customerId}'), headers: headers);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final customer = Customer.fromJson(data);
        emit(CustomerLoaded(customer: customer));
      } else {
        emit(CustomerError('Error fetching customer'));
      }
    } catch (error) {
      emit(CustomerError(error.toString()));
    }
  }
}
