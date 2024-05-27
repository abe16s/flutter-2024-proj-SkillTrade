import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_trade/presentation/screens/technician_profile.dart';
import 'package:skill_trade/presentation/themes.dart';
import 'package:skill_trade/presentation/widgets/technician_booking_list.dart';
import 'package:skill_trade/presentation/widgets/drawer.dart';
import 'package:skill_trade/state_managment/bookings/bookings_bloc.dart';
import 'package:skill_trade/state_managment/customer/customer_bloc.dart';
import 'package:skill_trade/state_managment/individual_technician/individual_technician_bloc.dart';

// void main() {
//   runApp(TechnicianPage());
// }

class TechnicianPageLogic {
  int selectedIndex = 0;

  void navigateBottomBar(int index) {
    selectedIndex = index;
  }

  Widget getCurrentPage() {
    final List<Widget> pages = [
      const TechnicianBookingList(),
      const TechnicianProfile(),
    ];
    return pages[selectedIndex];
  }
}

class TechnicianPage extends StatefulWidget {
  const TechnicianPage({super.key});

  @override
  State<TechnicianPage> createState() => _TechnicianPageState();
}

class _TechnicianPageState extends State<TechnicianPage> {
  final TechnicianPageLogic _logic = TechnicianPageLogic();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Technician Page",
      theme: lightMode,
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CustomerBloc>(
            create: (BuildContext context) => CustomerBloc(),
          ),
          BlocProvider<BookingsBloc>(
            create: (BuildContext context) => BookingsBloc(),
          ),
          BlocProvider<IndividualTechnicianBloc>(
            create: (BuildContext context) => IndividualTechnicianBloc(),
          ),
        ],
        child: Scaffold(
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
          body: _logic.getCurrentPage(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _logic.selectedIndex,
            onTap: (index) {
              setState(() {
                _logic.navigateBottomBar(index);
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined),
                label: "Bookings",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: "My Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
