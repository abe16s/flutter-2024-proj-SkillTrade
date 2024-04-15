import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "../widgets/info_label.dart";

void main() {
  runApp(const MaterialApp(
    home: MyBookings(),
  ));
}

class MyBookings extends StatefulWidget {
  const MyBookings({super.key});

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  late DateTime? _selectedDate = null;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Initial date selected
      firstDate: DateTime(2010), // First selectable date
      lastDate: DateTime(2050), // Last selectable date
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            SizedBox(height: 10,),
            Text(
              "Technician",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 20,),
            Image.asset("assets/technician.png", width: 125, height: 125,),
            SizedBox(height: 5,),
            Text(
              "Abenezer Seifu",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoLabel(label: "Email", data: "mysteryabe456@gmail.com"),
                  SizedBox(height: 3,),
                  InfoLabel(label: "Phone", data: "0936120470"),
                  SizedBox(height: 3,),
                  InfoLabel(label: "Skills", data: "Electrican, Dish technician"),
                  SizedBox(height: 3,),
                  InfoLabel(label: "Experience", data: "15 years in ELPA, 3 amet did mastat"),
                  SizedBox(height: 3,),
                  InfoLabel(label: "Education Level", data: "Bsc. in Electrical Engineering"),
                  SizedBox(height: 3,),
                  InfoLabel(label: "Available Location", data: "Harar"),
                  SizedBox(height: 3,),
                  InfoLabel(label: "Additional Bio", data: "Tiris yeneqelkubet"),
                ],
              ),
              
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ),
            Text(
              "Book Service",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Service \nDate:", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedDate == null
                                ? 'No date selected'
                                : '${_selectedDate.toString().substring(0,10)}',
                          ),
                          // SizedBox(height: 20),
                          TextButton(
                            onPressed: () => _selectDate(context),
                            child: Text('Select Date'),
                          ),
                        ],
                      ),
                    
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Service \nNeeded:", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),),
                      SizedBox(width: 7,),
                      SizedBox(
                        width: 220,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ), 
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Service \nLocation:", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),),
                      SizedBox(width: 7,),
                      SizedBox(
                        width: 220,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ), 
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Problem \nDescription:", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),),
                      SizedBox(width: 7,),
                      SizedBox(
                        width: 220,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ), 
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: 250,
                    child: TextButton(
                      onPressed: () {}, 
                      child: Text("Book", style: TextStyle(color: Colors.white),),
                      style: ButtonStyle(
                        backgroundColor:  MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
  }
}