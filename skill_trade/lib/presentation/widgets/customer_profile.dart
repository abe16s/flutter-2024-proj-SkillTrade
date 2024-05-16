import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/widgets/info_label.dart';

class customerProfile extends StatelessWidget {
  const customerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage("assets/profile.jpg"),
            ),
            SizedBox(height: 10),
            InfoLabel(label: "Name", data: "Biniyam Assefa",),
            InfoLabel(label: "Email", data: "biniyamassefa648@gmail.com"),
            InfoLabel(label: "Phone", data: " 0940185778"),
            // Text(
            //   "Biniyam Assefa",
            //   style: TextStyle(fontSize: 20),
            // ),
            // Text(
            //   "biniyamassefa648@gmail.com",
            //   style: TextStyle(fontSize: 15),
            // ),
            // Text(
            //   "Tel: +2519-4018-5778",
            //   style: TextStyle(fontSize: 15),
            // ),
          ],
        ),
      ),
    );
  }
}

