import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skill_trade/main.dart';
import 'package:skill_trade/presentation/screens/admin_customer.dart';
import 'package:skill_trade/presentation/screens/admin_page.dart';
import 'package:skill_trade/presentation/screens/admin_technician.dart';
import 'package:skill_trade/presentation/screens/reported_technicians.dart';
import 'package:skill_trade/presentation/screens/technicians_list.dart';
import 'package:skill_trade/presentation/widgets/drawer.dart';

void main() {
  testWidgets('Initial route is AdminPage', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify that the initial page is AdminPage
    expect(find.byType(MyHomePage), findsOneWidget);
  });

  testWidgets('BottomNavigationBar changes pages', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify initial page
    expect(find.byType(AdminPage), findsOneWidget);

    // Tap on the 'Reports' tab
    await tester.tap(find.byIcon(Icons.warning));
    await tester.pump();

    // Verify that the page has changed to ReportedTechnicians
    expect(find.byType(ReportedTechnicians), findsOneWidget);

    // Tap on the 'Customers' tab
    await tester.tap(find.byIcon(Icons.person));
    await tester.pump();

    // Verify that the page has changed to CustomersList
    expect(find.byType(AdminCustomer), findsOneWidget);

    // Tap on the 'Technicians' tab
    await tester.tap(find.byIcon(Icons.person_search));
    await tester.pump();

    // Verify that the page has changed to TechniciansList
    expect(find.byType(TechniciansList), findsOneWidget);
  });

  testWidgets('Drawer opens and contains expected items', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Open the drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump(); // Start the animation
    await tester.pump(const Duration(seconds: 1)); // Wait for the animation to finish

    // Verify that the drawer is open
    expect(find.byType(MyDrawer), findsOneWidget);

    // Verify drawer items
    expect(find.text('Admin Technician'), findsOneWidget);
    expect(find.text('Admin Customer'), findsOneWidget);
  });
}
