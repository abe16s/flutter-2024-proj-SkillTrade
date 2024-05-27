import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_trade/admin.dart';
import 'package:skill_trade/customer.dart';
import 'package:skill_trade/presentation/screens/admin_customer.dart';
import 'package:skill_trade/presentation/screens/admin_page.dart';
import 'package:skill_trade/presentation/screens/admin_technician.dart';
import 'package:skill_trade/presentation/screens/home_page.dart';
import 'package:skill_trade/presentation/screens/login_page.dart';
import 'package:skill_trade/presentation/screens/signup_page.dart';
import 'package:skill_trade/presentation/screens/technician_application_success.dart';
import 'package:skill_trade/presentation/themes.dart';
import 'package:skill_trade/state_managment/auth/auth_bloc.dart';
import 'package:skill_trade/state_managment/auth/auth_state.dart';
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
          "/admintech": (context) => AdminTechnician(),
          "/admincustomer": (context) => AdminCustomer(),
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

class GetFirstPageLogic {
  Widget getLoggedInPage(String role) {
    switch (role) {
      case "customer":
        return const CustomerPage();
      case "technician":
        return const TechnicianPage();
      case "admin":
        return const AdminPage();
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
