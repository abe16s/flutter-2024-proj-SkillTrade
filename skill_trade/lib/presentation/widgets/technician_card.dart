import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_trade/models/technician.dart';
// import 'package:skill_trade/presentation/screens/bookings.dart';

class TechnicianCard extends StatelessWidget {
  // final String name, speciality;
  final Technician technician;
  const TechnicianCard ({super.key, required this.technician});

  @override
  Widget build(BuildContext context) {
  

    return Card(
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/technician.png", width: 60, height: 60,),
            ListTile(
              title: Text(technician.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
              subtitle: Text("Speciality: ${technician.speciality}", style: TextStyle(fontSize: 17), textAlign: TextAlign.center,),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/booktech");
              }, 
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
              ),
              child: const Text("Get Technician", style: TextStyle(color: Colors.white, fontSize: 15),),
              
              ),
          ],
        ),
      ),
    );
  }
}