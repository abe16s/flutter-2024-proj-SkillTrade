import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/widgets/technician_card.dart';

void main() {
  runApp(const MaterialApp(
    home: FindTechnician(),
  ));
}

class FindTechnician extends StatelessWidget {
  const FindTechnician({super.key});

  void Function()? onTap {
      print("ff");

  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: GridView.extent(
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
              maxCrossAxisExtent: 320,
              children: List.generate(8, (index) {
                return GestureDetector(
                  child: TechnicianCard()
                  onTap: () {print("hello")},
                );
                
              }),
          ),
        ),
      )
    );
  }
}