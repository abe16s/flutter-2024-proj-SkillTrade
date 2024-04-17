import 'package:flutter/material.dart';

class TechnicianTile extends StatelessWidget {
  const TechnicianTile ({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.asset("assets/technician.png"),
          ),
          title: Text("Abenezer Seifu", style: TextStyle(fontWeight: FontWeight.w500),),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Email: mysteryabe456@gmail.com"),
              Text("tel: 0936120470"),
              Text("Skills: Electrician"),
            ],
          ),
          trailing: TextButton(onPressed: () {}, child: Text("Review")),
        ),
      );
  }
}