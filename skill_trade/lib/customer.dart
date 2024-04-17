import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/screens/bookings.dart';
import 'package:skill_trade/presentation/screens/find_technicians.dart';

void main() {
  runApp(FirstTime());
}

class FirstTime extends StatelessWidget {
  const FirstTime({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "First time user Page",
      initialRoute: "/findtech",
      routes: {
        "/findtech": (context) => FindTechnician(),
        "/booktech": (context) => MyBookings(),
      },
    );
  }
}