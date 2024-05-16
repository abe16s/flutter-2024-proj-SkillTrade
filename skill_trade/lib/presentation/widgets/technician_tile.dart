import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/screens/admin_technician.dart';

class TechnicianTile extends StatelessWidget {
  const TechnicianTile ({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.secondary,
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.asset("assets/technician.png"),
          ),
          title: const Text("Abenezer Seifu", style: TextStyle(fontWeight: FontWeight.w500),),
          subtitle: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Email: mysteryabe456@gmail.com"),
              Text("tel: 0936120470"),
              Text("Skills: Electrician"),
            ],
          ),
          trailing: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/admintech" );
              
            }, 
          child: const Text("Review")),
        ),
      );
  }
}