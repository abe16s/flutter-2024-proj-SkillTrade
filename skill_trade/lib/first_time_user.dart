import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_trade/admin.dart';
import 'package:skill_trade/customer.dart';
import 'package:skill_trade/presentation/screens/admin_customer.dart';
import 'package:skill_trade/presentation/screens/home_page.dart';
import 'package:skill_trade/presentation/screens/login_page.dart';
import 'package:skill_trade/presentation/screens/signup_page.dart';
import 'package:skill_trade/presentation/screens/technician_application_success.dart';
import 'package:skill_trade/presentation/themes.dart';
import 'package:skill_trade/state_managment/auth/auth_bloc.dart';
import 'package:skill_trade/technician.dart';

// void main() {
//   runApp(const FirstTimeUserPage());
// }

class FirstTimeUserPage extends StatefulWidget {
  const FirstTimeUserPage({super.key});

  @override
  State<FirstTimeUserPage> createState() => _FirstTimeUserPageState();
}

class _FirstTimeUserPageState extends State<FirstTimeUserPage> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp( 
      debugShowCheckedModeBanner: false,
      title: "SkillTrade Hub",
      theme: lightMode,
      initialRoute: "/",
      routes: {
        // "/login" : (context) => LoginPage(),
        // "/signup" : (context) => SignupPage(),
        // "/customer":(context) => CustomerPage(),
        // "/technician":(context) => TechnicianPage(),
        // "/apply":(context) => TechnicianApplicationSuccess(),
        // "/admintech": (context) => AdminTechnician(),
        "/admincustomer": (context) => AdminCustomer(),
        "/login" : (context) =>  MultiBlocProvider(
            providers: [
              BlocProvider<AuthBloc>(
                create: (BuildContext context) => AuthBloc(),
              ),
              // BlocProvider<BookingsBloc>(
              //   create: (BuildContext context) => BookingsBloc(),
              // ),
              // BlocProvider<IndividualTechnicianBloc>(
              //   create: (BuildContext context) => IndividualTechnicianBloc(),
              // ),
            ],
            child: const LoginPage(),
        ),
        "/signup" : (context) => MultiBlocProvider(
            providers: [
              BlocProvider<AuthBloc>(
                create: (BuildContext context) => AuthBloc(),
              ),
            ],
            child: const SignupPage(),
        ),
        "/customer":(context) => CustomerPage(),
        "/technician":(context) => TechnicianPage(),
        "/admin":(context) => AdminSite(),
        "/apply":(context) => TechnicianApplicationSuccess(),
        // "/booktech": (context) => MyBookings(),

      },
      home: HomeScreen(),
    );
  }
}

