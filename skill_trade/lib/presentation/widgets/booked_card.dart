import 'package:flutter/material.dart';

class TechnicianBookingScreen extends StatelessWidget {
  const TechnicianBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for the booking card
    final bookingData = {
      'problemTitle': 'Leaking Pipe',
      'problemDescription': 'The kitchen sink pipe is leaking.',
      'location': 'Addis Ababa',
      'name': 'John Doe',
    };

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bookingData['problemTitle'] ?? "None",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                bookingData['problemDescription'] ?? "None",
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 8),
              Text(
                'Location: ${bookingData['location']}',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 8),
              Text(
                'Name: ${bookingData['name']}',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle accept button press
                      print('Accept button pressed');
                    },
                    child: const Text('Accept'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle decline button press
                      print('Decline button pressed');
                    },
                    child: const Text('Decline'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle delete button press
                      print('Delete button pressed');
                    },
                    child: const Text('Delete'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
