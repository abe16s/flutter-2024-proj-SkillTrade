import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              DrawerHeader(child: Image.asset("assets/logo.jpg",)),
            
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Divider(color: Colors.grey[800]),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.info, color: Colors.white,),
                  title: Text("About", style: TextStyle(color: Colors.white),),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.settings, color: Colors.white,),
                  title: Text("Settings", style: TextStyle(color: Colors.white),),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.feedback, color: Colors.white,),
                  title: Text("Feedback", style: TextStyle(color: Colors.white),),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.rule, color: Colors.white,),
                  title: Text("Rules and Regulations", style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25.0, bottom: 25.0),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.white,),
                title: Text("Logout", style: TextStyle(color: Colors.white),),
              ),
            ),

          ],
        ),
      );
  }
}