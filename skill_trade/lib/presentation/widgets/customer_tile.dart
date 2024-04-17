import 'package:flutter/material.dart';

class CustomerTile extends StatelessWidget {
  const CustomerTile ({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.asset("assets/customer.png"),
          ),
          title: Text("Abenezer Seifu", style: TextStyle(fontWeight: FontWeight.w500),),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Email: mysteryabe456@gmail.com"),
              Text("tel: 0936120470"),
            ],
          ),
          trailing: TextButton(onPressed: () {}, child: Text("Review")),
        ),
      );
  }
}