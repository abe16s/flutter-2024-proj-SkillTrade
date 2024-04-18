import 'package:flutter/material.dart';

class CustomerSmallProfile extends StatelessWidget {
  const CustomerSmallProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
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
    );
  }
}
