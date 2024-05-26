import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skill_trade/admin.dart';
import 'package:skill_trade/presentation/screens/admin_page.dart';
import 'package:skill_trade/presentation/screens/admin_technician.dart';
import 'package:skill_trade/presentation/screens/admin_users_page.dart';
import 'package:skill_trade/presentation/screens/reported_technicians.dart';
import 'package:skill_trade/presentation/screens/technicians_list.dart';

void main() {
  testWidgets('AdminSite widget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify the initial state
    expect(find.text('SkillTrade'), findsOneWidget);
    expect(find.byIcon(Icons.file_copy), findsOneWidget);
    expect(find.byIcon(Icons.warning), findsOneWidget);
    expect(find.byIcon(Icons.person),
        findsOneWidget); // Adjusted from findsNWidgets(2)
    expect(find.byIcon(Icons.person_search), findsOneWidget);

    // Verify initial page
    expect(find.byType(AdminPage), findsOneWidget);

    // Tap on the Reports tab and verify navigation
    await tester.ensureVisible(find.byIcon(Icons.warning));
    await tester.tap(find.byIcon(Icons.warning));
    await tester.pumpAndSettle();
    expect(find.byType(ReportedTechnicians), findsOneWidget);

    // Tap on the Customers tab and verify navigation
    await tester.ensureVisible(find.byIcon(Icons.person).first);
    await tester.tap(find.byIcon(Icons.person).first);
    await tester.pumpAndSettle();
    expect(find.byType(CustomersList), findsOneWidget);

    // Tap on the Technicians tab and verify navigation
    await tester.ensureVisible(find.byIcon(Icons.person_search));
    await tester.tap(find.byIcon(Icons.person_search));
    await tester.pumpAndSettle();
    expect(find.byType(TechniciansList), findsOneWidget);

    // Open the drawer and verify its presence
    await tester.ensureVisible(find.byIcon(Icons.menu));
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    expect(find.byType(Drawer), findsOneWidget);

    // Close the drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    // Verify navigation to AdminTechnician screen using routes
    await tester.pumpWidget(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const AdminSite(),
        '/admintech': (context) => AdminTechnician(),
      },
    ));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Technicians'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.person_search));
    await tester.pumpAndSettle();
    expect(find.byType(AdminTechnician), findsNothing);
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    expect(find.byType(AdminPage), findsOneWidget);
  });
}
