import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_trade/presentation/widgets/customer_profile.dart';
import 'package:skill_trade/state_managment/customer/customer_bloc.dart';
import 'package:skill_trade/state_managment/customer/customer_event.dart';
import 'package:skill_trade/state_managment/customer/customer_state.dart';

class AdminCustomer extends StatelessWidget {
  final int customerId;
  const AdminCustomer({super.key, required this.customerId});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CustomerBloc>(context).add(LoadCustomer(customerId: customerId.toString()));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          BlocBuilder<CustomerBloc, CustomerState>(
            builder: (context, state) {
              if (state is CustomerLoaded) {
                return customerProfile(customer: state.customer);
              }  else if (state is CustomerLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CustomerError) {
                return Center(child: Text(state.error));
              } else {
                return Container();
              }
            }
          ),
          const SizedBox(
            height: 30,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     ElevatedButton(
          //       onPressed: () {},
          //       style: ButtonStyle(
          //         backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          //       ),
          //       child: const Text(
          //         "Suspend",
          //         style: TextStyle(
          //             color: Colors.white, fontWeight: FontWeight.w600),
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 20,
          //     ),
          //     ElevatedButton(
          //       onPressed: () {},
          //       style: ButtonStyle(
          //         backgroundColor:
          //             MaterialStateProperty.all<Color>(Colors.green),
          //       ),
          //       child: const Text(
          //         "Unsuspend",
          //         style: TextStyle(
          //             color: Colors.white, fontWeight: FontWeight.w600),
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 30,
          // ),
          // const Padding(
          //   padding: EdgeInsets.only(left: 15.0),
          //   child: Text(
          //     "Booking History",
          //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          //   ),
          // ),
          // for (int i = 0; i < 2; i++)
            // const CustomerBooking(
            //   editAccess: false,
            // )
        ],
      ),
    );
  }
}
