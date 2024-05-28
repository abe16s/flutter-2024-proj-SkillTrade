import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_trade/admin.dart';
import 'package:skill_trade/customer.dart';
import 'package:skill_trade/presentation/screens/admin_customer.dart';
import 'package:skill_trade/presentation/screens/admin_technician.dart';
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightMode,
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/admintech": (context) => MultiBlocProvider(
            providers: [
              BlocProvider<IndividualTechnicianBloc>(
                create: (BuildContext context) => IndividualTechnicianBloc(),
              ),
              BlocProvider<BookingsBloc>(
                create: (BuildContext context) => BookingsBloc(),
              ),
              BlocProvider<ReviewsBloc>(
                create: (BuildContext context) => ReviewsBloc(),
              ),
            ],
            child: AdminTechnician(),
          ),
          "/admincustomer": (context) => MultiBlocProvider(
            providers: [
              BlocProvider<CustomerBloc>(
                create: (BuildContext context) => CustomerBloc(),
              ),
            ],
            child: AdminCustomer(),
          ),
          "/login": (context) => const LoginPage(),
          "/signup": (context) => const SignupPage(),
          "/customer": (context) => CustomerPage(),
          "/technician": (context) => TechnicianPage(),
          "/admin": (context) => AdminSite(),
          "/apply": (context) => TechnicianApplicationSuccess(),
        },
        home: const GetFirstPage(),
      ),
    );
  }
}

class GetFirstPage extends StatelessWidget {
  const GetFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        if (state is LoggedIn) {
          return _buildLoggedIn(state.role!);
        } else {
          return const HomeScreen();
        }
      },
    );
  }

  Widget _buildLoggedIn(String role) {
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
