import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_trade/models/booking.dart';
import 'package:skill_trade/presentation/widgets/technician_booking_card.dart';
import 'package:skill_trade/state_managment/bookings/bookings_bloc.dart';
import 'package:skill_trade/state_managment/bookings/bookings_event.dart';
import 'package:skill_trade/state_managment/bookings/bookings_state.dart';
import 'package:skill_trade/state_managment/customer/customer_bloc.dart';
import 'package:skill_trade/state_managment/customer/customer_event.dart';
import 'package:skill_trade/state_managment/customer/customer_state.dart';

class TechnicianBookingList extends StatelessWidget {
  const TechnicianBookingList({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BookingsBloc>(context).add(LoadCustomerBookings());
    return BlocBuilder<BookingsBloc, BookingsState>(
        builder: (context, state) {
          if (state is BookingsLoading){
            return const Center(child: CircularProgressIndicator());
          } else if (state is BookingsLoaded) {
            final List<Booking> bookings = state.bookings.reversed.toList();
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
                      itemCount: state.bookings.length,
                      
                      itemBuilder: (context, index){ 
                        BlocProvider.of<CustomerBloc>(context).add(LoadCustomer(customerId: bookings[index].customerId));
                        return  BlocBuilder<CustomerBloc, CustomerState>(
                          builder: (context, state) {
                            if (state is CustomerLoaded) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TechnicianBookingCard(booking: bookings[index], editAccess: true, customer: state.customer,),
                              );
                            } else if (state is CustomerLoading) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (state is CustomerError) {
                              return Center(child: Text(state.error));
                            } else {
                              return Container();
                            }
                          }
                        );
                      },
                    ),
                  ),
                ],
              );
          } else if (state is BookingsError) {
            return Center(child: Text(state.error));
          } else {
            return Container();
          }
        }
      );
  }
}
