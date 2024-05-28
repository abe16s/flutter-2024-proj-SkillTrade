import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skill_trade/first_time_user.dart';
import 'package:skill_trade/state_managment/auth/auth_bloc.dart';

void main() {
  testWidgets('FirstTimeUserPage navigation test', (WidgetTester tester) async {
    // Build the FirstTimeUserPage widget
    await tester.pumpWidget(const FirstTimeUserPage());

    // Verify if the initial screen is HomeScreen
    expect(find.byKey(const Key('home_screen')), findsOneWidget);

    // Trigger navigation to LoginPage
    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pumpAndSettle();

    // Verify if the LoginPage is displayed
    expect(find.byKey(const Key('login_page')), findsOneWidget);

    // Verify if AuthBloc is provided
    expect(find.byType(BlocProvider<AuthBloc>), findsOneWidget);

    // Navigate back to HomeScreen
    Navigator.pop(tester.element(find.byKey(const Key('login_page'))));
    await tester.pumpAndSettle();

    // Verify if the HomeScreen is displayed again
    expect(find.byKey(const Key('home_screen')), findsOneWidget);

    // Trigger navigation to SignupPage
    await tester.tap(find.byKey(const Key('signup_button')));
    await tester.pumpAndSettle();

    // Verify if the SignupPage is displayed
    expect(find.byKey(const Key('signup_page')), findsOneWidget);

    // Verify if AuthBloc is provided
    expect(find.byType(BlocProvider<AuthBloc>), findsOneWidget);
  });
}
