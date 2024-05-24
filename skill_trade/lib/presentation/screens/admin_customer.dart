import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/widgets/customer_profile.dart';

class AdminCustomer extends StatelessWidget {
  const AdminCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const customerProfile(),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: const Text(
                  "Suspend",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: const Text(
                  "Unsuspend",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              "Booking History",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
          // for (int i = 0; i < 2; i++)
            // const CustomerBooking(
            //   editAccess: false,
            // )
        ],
      ),
    );
  }
}
