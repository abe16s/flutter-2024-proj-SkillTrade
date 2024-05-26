import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_trade/models/booking.dart';
import 'package:skill_trade/presentation/widgets/customer_booking.dart';
import 'package:skill_trade/riverpod/booking_provider.dart';
import 'package:skill_trade/riverpod/technician_provider.dart';
class CustomerBookings extends ConsumerWidget {
  const CustomerBookings({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bookingAsyncValue = ref.watch(bookingsProvider);

    return bookingAsyncValue.when(
        data: (bookings) =>     ListView.builder(
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            final booking = bookings[index];

            return Consumer(
            
            builder: (context, watch, _) {
                    final technicianAsync = ref.watch(technicianByIdProvider(booking.technicianId));
                    
                    print("bookings $bookings ");
                    return technicianAsync.when(
                      data: (technician) {
                        // print("technician $technician ");
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CustomerBooking(
                            technician: technician ,
                            booking: booking,
                          ),
                        );
                      },
                      loading: () => Center(child: CircularProgressIndicator()),
                      error: (error, stack) => Center(child: Text('Error loading customer: $error')),
                    );
                  }
            
            );
          
          },
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error loading bookings: $error')),
      );
  }
}