import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_trade/presentation/widgets/info_label.dart';
import 'package:skill_trade/state_managment/customer/customer_bloc.dart';
import 'package:skill_trade/state_managment/customer/customer_event.dart';
import 'package:skill_trade/state_managment/customer/customer_state.dart';
import 'package:skill_trade/storage.dart';

class customerProfile extends StatelessWidget {
  customerProfile({super.key});

  Future<void> loadId(context) async {
    String? id = await SecureStorage.instance.read("id");
    BlocProvider.of<CustomerBloc>(context).add(LoadCustomer(customerId: id!));
  }

  @override
  Widget build(BuildContext context) {
    loadId(context);
    return Container(
      padding: const EdgeInsets.only(top: 60),
      child: Center(
        child: BlocBuilder<CustomerBloc, CustomerState>(
        builder: (context, state) {
          if (state is CustomerLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage("assets/profile.jpg"),
                ),
                SizedBox(height: 10),
                InfoLabel(label: "Name", data: state.customer.fullName,),
                InfoLabel(label: "Email", data: state.customer.email),
                InfoLabel(label: "Phone", data: state.customer.phone),
              ],
            );
          } else if (state is CustomerLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CustomerError) {
            return Center(child: Text(state.error));
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}

