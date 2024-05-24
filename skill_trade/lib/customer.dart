import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_trade/presentation/screens/bookings.dart';
import 'package:skill_trade/presentation/screens/customer_profile.dart';
import 'package:skill_trade/presentation/screens/customer_bookings.dart';
import 'package:skill_trade/presentation/screens/find_technicians.dart';
import 'package:skill_trade/presentation/themes.dart';
import 'package:skill_trade/presentation/widgets/drawer.dart';

void main() {
  runApp(const ProviderScope(
    child: const CustomerPage(),
  ));
}

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const FindTechnician(),
    const CustomerBookings(),
    const CustomerProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Customer Page",
      initialRoute: "/",
      routes: {
        "/booktech": (context) => MyBookings(),
      },
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Icon(Icons.menu),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          title: const Text("SkillTrade"),
          centerTitle: true,
        ),
        drawer: const MyDrawer(),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: navigateBottomBar,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.build_outlined), label: "Find Technician"),
            BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined), label: "My Bookings"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: "My Profile"),
          ],
        ),
      ),
    );
  }
}
