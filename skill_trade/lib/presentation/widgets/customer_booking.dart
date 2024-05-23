import 'package:flutter/material.dart';
import 'package:skill_trade/models/booking.dart';
import 'package:skill_trade/models/technician.dart';
import 'package:skill_trade/presentation/widgets/editable_textfield.dart';
import 'package:skill_trade/presentation/widgets/info_label.dart';

class CustomerBooking extends StatelessWidget {
  final bool editAccess;
  final Booking booking;
  final Technician technician;
  const CustomerBooking({super.key, required this.booking, required this.editAccess, required this.technician});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        // color: Colors.grey[200],
        color: Theme.of(context).colorScheme.secondary,
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
            technician.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 7,),
          InfoLabel(label: "Email", data: technician.email),
          SizedBox(height: 7,),
          InfoLabel(label: "Speciality", data: technician.skills),
          SizedBox(height: 7,),
          InfoLabel(label: "Phone", data: technician.phone),
          SizedBox(height: 20,),
      
          EditableField(label: "Booked Date", data: booking.bookedDate.toString().substring(0, 10)),
          EditableField(label: "Service Date", data: booking.serviceDate.toString().substring(0, 10)),
          EditableField(label: "Service Needed", data: booking.serviceNeeded),
          EditableField(label: "Problem Description", data: booking.problemDescription),
          EditableField(label: "Service Location", data: booking.serviceLocation),
          EditableField(label: "Status", data: booking.status),

          if (editAccess) TextButton(
            onPressed: () {}, 
            child: Text("Edit", style: TextStyle(color: Colors.white),),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary)
            ),
          ),
        ],
      ),
    );
  }
}
