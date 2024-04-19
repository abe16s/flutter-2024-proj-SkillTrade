import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/widgets/customer_booking.dart';
import 'package:skill_trade/presentation/widgets/customer_profile.dart';

class AdminCustomer extends StatelessWidget {
  const AdminCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          customerProfile(),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text("Suspend", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
              ),
              SizedBox(width: 20,),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: Text("Unsuspend", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
              ),              
            ],
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text("Booking History", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
          ),
          for (int i=0; i < 2; i++) 
              CustomerBooking(editAccess: false,)
        ],
      ),
    );
  }
}