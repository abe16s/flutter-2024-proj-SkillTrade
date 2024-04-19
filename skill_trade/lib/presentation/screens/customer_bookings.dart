import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/widgets/customer_booking.dart';

class CustomerBookings extends StatelessWidget {
  const CustomerBookings({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (int i=0; i < 3; i++) 
          CustomerBooking(editAccess: true,)
      ],
    );
  }
}