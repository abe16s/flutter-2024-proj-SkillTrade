// ignore_for_file: camel_case_types

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
