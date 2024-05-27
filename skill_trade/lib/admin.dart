import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/screens/admin_customer.dart';
import 'package:skill_trade/presentation/screens/admin_page.dart';
import 'package:skill_trade/presentation/screens/admin_technician.dart';
import 'package:skill_trade/presentation/screens/reported_technicians.dart';
import 'package:skill_trade/presentation/screens/technicians_list.dart';
import 'package:skill_trade/presentation/themes.dart';
import 'package:skill_trade/presentation/widgets/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: lightMode,
      initialRoute: "/",
      routes: { 
        "/admintech": (context) => AdminTechnician(),
        "/admincustomer": (context) => AdminCustomer(),
      },
      debugShowCheckedModeBanner: false,
      home: const AdminSite(),
    );
  }
}

class AdminSiteLogic {
  int currentIndex = 0;

  final List<Widget> pages = [
    const AdminPage(),
    const ReportedTechnicians(),
    const AdminCustomer(),
    const TechniciansList()
  ];

  void onItemTapped(int index) {
    currentIndex = index;
  }

  Widget getCurrentPage() {
    return pages[currentIndex];
  }
}

class AdminSite extends StatefulWidget {
  const AdminSite({super.key});
  @override
  _AdminSiteState createState() => _AdminSiteState();
}

class _AdminSiteState extends State<AdminSite> {
  final AdminSiteLogic _logic = AdminSiteLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SkillTrade'),
        centerTitle: true,
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
      ),
      drawer: const MyDrawer(),
      body: _logic.getCurrentPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _logic.currentIndex,
        onTap: (index) {
          setState(() {
            _logic.onItemTapped(index);
          });
        },
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
