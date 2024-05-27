import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_trade/customer.dart';
import 'package:skill_trade/presentation/screens/customer_profile.dart';
import 'package:skill_trade/presentation/screens/customer_bookings.dart';
import 'package:skill_trade/presentation/screens/find_technicians.dart';
import 'package:skill_trade/presentation/themes.dart';

import 'package:skill_trade/state_managment/bookings/bookings_bloc.dart';
import 'package:skill_trade/state_managment/find_technician/find_tecnician_bloc.dart';
import 'package:skill_trade/state_managment/individual_technician/individual_technician_bloc.dart';

void main() {
  testWidgets('CustomerPage displays correct pages on BottomNavigationBar tap',
      (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        theme: lightMode,
        home: MultiBlocProvider(
          providers: [
            BlocProvider<TechniciansBloc>(
              create: (BuildContext context) => TechniciansBloc(),
            ),
            BlocProvider<BookingsBloc>(
              create: (BuildContext context) => BookingsBloc(),
            ),
            BlocProvider<IndividualTechnicianBloc>(
              create: (BuildContext context) => IndividualTechnicianBloc(),
            ),
          ],
          child: const CustomerPage(),
        ),
      ),
    );

    // Verify the initial state - should display FindTechnician
    expect(find.byType(FindTechnician), findsOneWidget);
    expect(find.byType(CustomerBookings), findsNothing);
    expect(find.byType(CustomerProfileScreen), findsNothing);

    // Tap on the My Bookings tab and verify
    print("Tapping My Bookings tab");
    await tester.tap(find.byIcon(Icons.book_outlined));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    print("Tapped My Bookings tab");
    expect(find.byType(FindTechnician), findsNothing);
    expect(find.byType(CustomerBookings), findsOneWidget);
    expect(find.byType(CustomerProfileScreen), findsNothing);

    // Tap on the My Profile tab and verify
    print("Tapping My Profile tab");
    await tester.tap(find.byIcon(Icons.person_2_outlined));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    print("Tapped My Profile tab");
    expect(find.byType(FindTechnician), findsNothing);
    expect(find.byType(CustomerBookings), findsNothing);
    expect(find.byType(CustomerProfileScreen), findsOneWidget);

    // Tap back on the Find Technician tab and verify
    print("Tapping Find Technician tab");
    await tester.tap(find.byIcon(Icons.build_outlined));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    print("Tapped Find Technician tab");
    expect(find.byType(FindTechnician), findsOneWidget);
    expect(find.byType(CustomerBookings), findsNothing);
    expect(find.byType(CustomerProfileScreen), findsNothing);
  });
}
