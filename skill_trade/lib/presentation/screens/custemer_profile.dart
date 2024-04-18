// ignore_for_file: camel_case_types, prefer_final_fields, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/widgets/customer_profile.dart';

void main() {
  runApp(const customerProfile());
}

class customerProfile extends StatelessWidget {
  const customerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.deepPurple),
      ),
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Customers Profile"),
          ),
          body: const CustomerSmallProfile()),
    );
  }
}

class Booking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        children: <Widget>[
          Text(
            "Biniyam Assefa",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "biniyamassefa648@gmail.com",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "speciality: dish_seri",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "Tel: +2519-4018-5778",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
