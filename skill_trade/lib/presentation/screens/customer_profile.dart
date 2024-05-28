import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_trade/presentation/widgets/customer_profile.dart';
import 'package:skill_trade/state_managment/customer/customer_bloc.dart';
import 'package:skill_trade/state_managment/customer/customer_event.dart';
import 'package:skill_trade/state_managment/customer/customer_state.dart';
import 'package:skill_trade/storage.dart';

class CustomerProfileScreen extends StatelessWidget {
  const CustomerProfileScreen({super.key});
  
  Future<void> loadId(context) async {
    String? id = await SecureStorage.instance.read("id");
    BlocProvider.of<CustomerBloc>(context).add(LoadCustomer(customerId: id!));
  }

  @override
  Widget build(BuildContext context) {
    loadId(context);
    return BlocBuilder<CustomerBloc, CustomerState>(
        builder: (context, state) {
          if (state is CustomerLoaded) {
            return customerProfile(customer: state.customer,);
          } else if (state is CustomerLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CustomerError) {
            return Center(child: Text(state.error));
          } else {
            return Container();
          }
        }
      );
  }
}
