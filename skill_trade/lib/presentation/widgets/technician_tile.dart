import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_trade/domain/models/technician.dart';

class TechnicianTile extends StatelessWidget {
  final Technician technician;
  const TechnicianTile ({super.key, required this.technician});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.secondary,
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.asset("assets/technician.png"),
          ),
          title: Text(technician.name, style: const TextStyle(fontWeight: FontWeight.w500),),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Email: ${technician.email}"),
              Text("tel: ${technician.phone}"),
              Text("Skills: ${technician.skills}"),
            ],
          ),
          trailing: TextButton(
            onPressed: () {
              context.push('/admintech', extra: technician.id);
            }, 
          child: const Text("Review")),
        ),
      );
  }
}