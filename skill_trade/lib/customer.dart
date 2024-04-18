import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/screens/custemer_profile.dart';
import 'package:skill_trade/presentation/screens/find_technicians.dart';
import 'package:skill_trade/presentation/widgets/drawer.dart';

void main() {
  runApp(CustomerPage());
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
    const customerProfile(),
    const customerProfile(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Customer Page",
      // initialRoute: "/findtech",
      // routes: {
      //   "/findtech": (context) => FindTechnician(),
      //   "/booktech": (context) => MyBookings(),
      // },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
          title: Text("SkillTrade"),
          centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: navigateBottomBar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.build_outlined),
            label: "Find Technician"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: "My Bookings"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "My Profile"
          ),
        ],
      ),
      ),

    );
  }
}