// ignore_for_file: camel_case_types, prefer_final_fields, use_key_in_widget_constructors

import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';

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
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: const Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage("assets/profile.jpg"),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Biniyam Assefa",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "biniyamassefa648@gmail.com",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "Tel: +2519-4018-5778",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              const Row(
                children: [
                  Text(
                    "Booked",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [Expanded(child: Booking())],
              )
            ],
          )),
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
