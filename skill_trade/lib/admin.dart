import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/screens/admin_page.dart';
import 'package:skill_trade/presentation/screens/admin_users_page.dart';
import 'package:skill_trade/presentation/screens/reported_technicians.dart';
import 'package:skill_trade/presentation/screens/technicians_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AdminSite(),
    );
  }
}

class AdminSite extends StatefulWidget {
  const AdminSite({super.key});
  @override
  _AdminSiteState createState() => _AdminSiteState();
}

class _AdminSiteState extends State<AdminSite> {
  int _currentIndex = 0;

  // Define the different pages to navigate to
  final List<Widget> _pages = [
    const AdminPage(),
    const ReportedTechnicians(),
    const CustomersList(),
    const TechniciansList()
  ];

  // Function to change the current index when an item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page'),
      ),
      body: _pages[
          _currentIndex], // Display the current page based on the current index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        iconSize: 24,
        selectedFontSize: 12,
        unselectedFontSize: 11,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.file_copy,
              size: 20,
            ),
            label: 'Applications',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.warning,
              size: 20,
            ),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 20),
            label: 'Customers',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_search,
              size: 20,
            ),
            label: 'Technicians',
          ),
        ],
      ),
    );
  }
}
