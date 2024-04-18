import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skill_trade/presentation/widgets/technician_card.dart';

class FindTechnician extends StatelessWidget {
  const FindTechnician({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              // decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text("Search", style: TextStyle(color: Colors.grey),),
                  Expanded(
                    child: SizedBox(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          ),
                          prefixIcon: Icon(Icons.search, color: Colors.grey,),
                          hintText: "Search",
                          contentPadding: EdgeInsets.symmetric(vertical: 14.0)
                        ),
                        
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      childAspectRatio: 0.55, // Aspect ratio (width / height)
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                    ), 
                    itemBuilder: (BuildContext context, int index) { 
                      return TechnicianCard();
                    },
                    itemCount: 8,
                    
                  // }),
              ),
            ),
          ],
        ),
      );
  }
}