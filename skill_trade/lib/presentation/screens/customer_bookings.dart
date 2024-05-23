import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_trade/models/booking.dart';
import 'package:skill_trade/presentation/widgets/customer_booking.dart';
import 'package:skill_trade/state_managment/bookings/bookings_bloc.dart';
import 'package:skill_trade/state_managment/bookings/bookings_event.dart';
import 'package:skill_trade/state_managment/bookings/bookings_state.dart';
import 'package:skill_trade/state_managment/individual_technician/individual_technician_bloc.dart';
import 'package:skill_trade/state_managment/individual_technician/individual_technician_event.dart';
import 'package:skill_trade/state_managment/individual_technician/individual_technician_state.dart';

class CustomerBookings extends StatelessWidget {
  const CustomerBookings({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BookingsBloc>(context).add(LoadCustomerBookings());
    return BlocBuilder<BookingsBloc, BookingsState>(
        builder: (context, state) {
          if (state is BookingsLoading){
            return const Center(child: CircularProgressIndicator());
          } else if (state is BookingsLoaded) {
            final List<Booking> bookings = state.bookings.reversed.toList();
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) { 
                BlocProvider.of<IndividualTechnicianBloc>(context).add(LoadIndividualTechnician(technicianId: bookings[index].technicianId));
                return BlocBuilder<IndividualTechnicianBloc, IndividualTechnicianState>(
                  builder: (context, state) {
                    if (state is IndividualTechnicianLoaded){
                      return CustomerBooking(
                        technician: state.technician,
                        booking: bookings[index],
                        editAccess: true,
                      );
                    } else if (state is IndividualTechnicianLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is IndividualTechnicianError) {
                      return Center(child: Text(state.error));
                    } else {
                      return Container();
                    }
                  }
                );
                // }
                
              },
              itemCount: bookings.length,
            );
          } else if (state is BookingsError) {
            return Center(child: Text(state.error));
          } else {
            return Container();
          }
        },
      );
  }
}
