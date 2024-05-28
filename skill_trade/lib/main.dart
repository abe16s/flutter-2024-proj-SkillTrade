import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_trade/admin.dart';
import 'package:skill_trade/customer.dart';
import 'package:skill_trade/models/technician.dart';
import 'package:skill_trade/presentation/screens/admin_customer.dart';
import 'package:skill_trade/presentation/screens/admin_technician.dart';
import 'package:skill_trade/presentation/screens/bookings.dart';
import 'package:skill_trade/presentation/screens/home_page.dart';
import 'package:skill_trade/presentation/screens/login_page.dart';
import 'package:skill_trade/presentation/screens/signup_page.dart';
import 'package:skill_trade/presentation/screens/technician_application_success.dart';
import 'package:skill_trade/presentation/themes.dart';
import 'package:skill_trade/state_managment/auth/auth_bloc.dart';
import 'package:skill_trade/state_managment/auth/auth_state.dart';
import 'package:skill_trade/state_managment/bookings/bookings_bloc.dart';
import 'package:skill_trade/state_managment/customer/customer_bloc.dart';
import 'package:skill_trade/state_managment/individual_technician/individual_technician_bloc.dart';
import 'package:skill_trade/state_managment/review/review_bloc.dart';
import 'package:skill_trade/storage.dart';
import 'package:skill_trade/technician.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SecureStorage.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(),
        ),
        BlocProvider<IndividualTechnicianBloc>(
          create: (BuildContext context) => IndividualTechnicianBloc(),
        ),
        BlocProvider<BookingsBloc>(
          create: (BuildContext context) => BookingsBloc(),
        ),
        BlocProvider<ReviewsBloc>(
          create: (BuildContext context) => ReviewsBloc(),
        ),
        BlocProvider<CustomerBloc>(
          create: (BuildContext context) => CustomerBloc(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: lightMode,
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const GetFirstPage(),
    ),
    GoRoute(
      path: '/admintech',
      builder: (context, state) {
          final technicianId = state.extra as int;
          return MultiBlocProvider(
            providers: [
              BlocProvider<ReviewsBloc>(
                create: (context) => ReviewsBloc(),
              ),
            ],
            child: AdminTechnician(technicianId: technicianId,),
          );
        },
    ),
    GoRoute(
      path: '/admincustomer',
      builder: (context, state) {
          final customerId = state.extra as int;
          return MultiBlocProvider(
            providers: [
              BlocProvider<CustomerBloc>(
                create: (context) => CustomerBloc(),
              ),
            ],
            child: AdminCustomer(customerId: customerId,),
          );
        },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      path: '/customer',
      builder: (context, state) => CustomerPage(),
    ),
    GoRoute(
      path: '/technician',
      builder: (context, state) => TechnicianPage(),
    ),
    GoRoute(
      path: '/admin',
      builder: (context, state) => AdminSite(),
    ),
    GoRoute(
      path: '/apply',
      builder: (context, state) => TechnicianApplicationSuccess(),
    ),
    GoRoute(
        path: '/myBookings',
        builder: (context, state) {
          final technician = state.extra as Technician;
          return MultiBlocProvider(
            providers: [
              BlocProvider<ReviewsBloc>(
                create: (context) => ReviewsBloc(),
              ),
              BlocProvider<BookingsBloc>(
                create: (context) => BookingsBloc(),
              ),
              BlocProvider<CustomerBloc>(
                create: (context) => CustomerBloc(),
              ),
            ],
            child: MyBookings(technician: technician),
          );
        },
      ),
  ],
);

class GetFirstPageLogic {
  Widget getLoggedInPage(String role) {
    switch (role) {
      case "customer":
        return const CustomerPage();
      case "technician":
        return const TechnicianPage();
      case "admin":
        return const AdminSite();
      default:
        return const HomeScreen();
    }
  }
}

class GetFirstPage extends StatelessWidget {
  const GetFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        if (state is LoggedIn) {
          return GetFirstPageLogic().getLoggedInPage(state.role!);
        } else {
          return const HomeScreen();
        }
      },
    );
  }
}
