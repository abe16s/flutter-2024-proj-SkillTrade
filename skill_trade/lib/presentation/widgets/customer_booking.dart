import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/widgets/editable_textfield.dart';
import 'package:skill_trade/presentation/widgets/info_label.dart';

class CustomerBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Booked With",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 15,),
          Text(
            "Biniyam Assefa",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 7,),
          InfoLabel(label: "Email", data: "biniyamassefa648@gmail.com"),
          SizedBox(height: 7,),
          InfoLabel(label: "Speciality", data: "Dish Technican"),
          SizedBox(height: 7,),
          InfoLabel(label: "Phone", data: "0940185778"),
          // Text(
          //   "biniyamassefa648@gmail.com",
          //   style: TextStyle(fontSize: 15),
          // ),
          // Text(
          //   "speciality: dish_seri",
          //   style: TextStyle(fontSize: 15),
          // ),
          // Text(
          //   "Tel: +2519-4018-5778",
          //   style: TextStyle(fontSize: 15),
          // ),
          SizedBox(height: 20,),
          // Text(
          //   "Booking details",
          //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          // ),
          EditableField(label: "Booked Date", data: "04/15/2024"),
          EditableField(label: "Service Date", data: "04/26/2024"),
          EditableField(label: "Service Needed", data: "Nile Sat"),
          EditableField(label: "Problem Description", data: "Dish sahnu nifas abelashtot"),
          EditableField(label: "Service Location", data: "6 kilo"),
          EditableField(label: "Status", data: "Pending"),

          TextButton(
            onPressed: () {}, 
            child: Text("Edit", style: TextStyle(color: Colors.white),),
            style: ButtonStyle(
              backgroundColor:  MaterialStateProperty.all<Color>(Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}
