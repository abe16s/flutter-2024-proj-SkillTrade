import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skill_trade/presentation/screens/admin_customer.dart';
import 'package:skill_trade/state_managment/customer/customer_bloc.dart';

void main() {
  testWidgets('AdminCustomer has a title, Suspend and Unsuspend buttons, and Booking History text', (WidgetTester tester) async {
    // Build the AdminCustomer widget.
    final customerBloc = CustomerBloc();
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<CustomerBloc>.value(value: customerBloc),
          // Add other providers if needed
        ],
        child: const MaterialApp(
          home: AdminCustomer(customerId: 1,),
        ),
      ),
    );

    // Verify the AppBar title.
    expect(find.text('Customer'), findsOneWidget);

    // Verify the presence of the Suspend button.
    expect(find.widgetWithText(ElevatedButton, 'Suspend'), findsOneWidget);

    // Verify the presence of the Unsuspend button.
    expect(find.widgetWithText(ElevatedButton, 'Unsuspend'), findsOneWidget);

    // Verify the presence of the Booking History text.
    expect(find.text('Booking History'), findsOneWidget);
  });
}
