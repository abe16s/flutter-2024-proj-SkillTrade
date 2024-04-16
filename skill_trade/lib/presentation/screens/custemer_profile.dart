// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

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
          body: const Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
          )),
    );
  }
}
