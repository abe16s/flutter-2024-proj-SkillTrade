import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/widgets/info_label.dart';

class TechnicianSmallProfile extends StatelessWidget {
  const TechnicianSmallProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 20,
        ),
        Image.asset(
          "assets/technician.png",
          width: 125,
          height: 125,
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          "Abenezer Seifu",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoLabel(label: "Email", data: "mysteryabe456@gmail.com"),
               SizedBox(
                height: 3,
              ),
              InfoLabel(label: "Phone", data: "0936120470"),
               SizedBox(
                height: 3,
              ),
              InfoLabel(label: "Skills", data: "Electrican, Dish technician"),
               SizedBox(
                height: 3,
              ),
              InfoLabel(
                  label: "Experience",
                  data: "15 years in ELPA, 3 amet did mastat"),
               SizedBox(
                height: 3,
              ),
              InfoLabel(
                  label: "Education Level",
                  data: "Bsc. in Electrical Engineering"),
               SizedBox(
                height: 3,
              ),
              InfoLabel(label: "Available Location", data: "Harar"),
               SizedBox(
                height: 3,
              ),
              InfoLabel(label: "Additional Bio", data: "Tiris yeneqelkubet"),
            ],
          ),
        )
      ],
    );
  }
}
