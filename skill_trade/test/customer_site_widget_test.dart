import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_trade/infrastructure/data_sources/bookings_remote_data_source_impl.dart';
import 'package:skill_trade/infrastructure/data_sources/individual_technician_remote_data_source.dart';
import 'package:skill_trade/infrastructure/data_sources/technician_remote_data_source.dart';
import 'package:skill_trade/infrastructure/repositories/bookings_repository_impl.dart';
import 'package:skill_trade/infrastructure/repositories/individual_technician_repository.dart';
import 'package:skill_trade/infrastructure/repositories/technician_repository.dart';
import 'package:skill_trade/infrastructure/storage/storage.dart';
import 'package:skill_trade/presentation/screens/customer.dart';
import 'package:skill_trade/presentation/screens/customer_profile.dart';
import 'package:skill_trade/presentation/screens/customer_bookings.dart';
import 'package:skill_trade/presentation/screens/find_technicians.dart';
import 'package:skill_trade/presentation/themes.dart';
import 'package:skill_trade/application/blocs/bookings_bloc.dart';
import 'package:skill_trade/application/blocs/find_technician_bloc.dart';
import 'package:skill_trade/application/blocs/individual_technician_bloc.dart';
import 'package:http/http.dart' as http;

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
              create: (BuildContext context) => TechniciansBloc(technicianRepository: TechnicianRepository(remoteDataSource: TechnicianRemoteDataSource())),
            ),
            BlocProvider<BookingsBloc>(
              create: (BuildContext context) => BookingsBloc(bookingsRepository: BookingsRepositoryImpl(BookingsRemoteDataSourceImpl(http.Client()), SecureStorage.instance)),
            ),
            BlocProvider<IndividualTechnicianBloc>(
              create: (BuildContext context) => IndividualTechnicianBloc(individualTechnicianRepository: IndividualTechnicianRepository(remoteDataSource: IndividualTechnicianRemoteDataSource())),
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
