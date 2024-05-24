import 'package:flutter/material.dart';

class AdminTechnician extends StatelessWidget {
  final Map<String, String> bookingData = {
    'problemTitle': 'Leaking Pipe',
    'problemDescription': 'The kitchen sink pipe is leaking.',
    'location': 'Addis Ababa',
    'name': 'John Doe',
  };

  AdminTechnician({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Technician"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // const TechnicianSmallProfile(),
          // SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: const Text(
                  "Suspend",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: const Text(
                  "Unsuspend",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              "Booking History",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
          // for (int i = 0; i < 2; i++)
          //   TechnicianBookingCard(
          //     bookingData: this.bookingData,
          //     editAccess: false,
          //   )
        ],
      ),
    );
  }
}
