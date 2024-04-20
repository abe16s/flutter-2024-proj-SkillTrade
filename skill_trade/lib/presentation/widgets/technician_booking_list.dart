import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/widgets/technician_booking_card.dart';

class TechnicianBookingList extends StatelessWidget {
  const TechnicianBookingList({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for the booking card
      final technician_bookings = [ 
    {
      'problemTitle': 'Leaking Pipe',
      'problemDescription': 'The kitchen sink pipe is leaking.',
      'location': 'Addis Ababa',
      'name': 'John Doe',
    }, {
      'problemTitle': 'Broken dish',
      'problemDescription': 'The satelite dish is not working.',
      'location': 'Addis Ababa',
      'name': 'John Doe',
    },
    {
      'problemTitle': 'Broken dish',
      'problemDescription': 'The satelite dish is not working.',
      'location': 'Addis Ababa',
      'name': 'John Doe',
    },{
      'problemTitle': 'Broken dish',
      'problemDescription': 'The satelite dish is not working.',
      'location': 'Addis Ababa',
      'name': 'John Doe',
    }
  ];

    return Column(
      children: [
          Container(
            color: Theme.of(context).colorScheme.background,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(5),
            child: const Text(
              "Booked To You...",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        Expanded(
          child: ListView.builder(             
            scrollDirection: Axis.vertical,
            itemCount: technician_bookings.length,
            
            itemBuilder: (context, index){ 
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: TechnicianBookingCard(bookingData: technician_bookings[index], editAccess: true,),
              );
            },
          ),
        ),
      ],
    );
    
    
  }
}
