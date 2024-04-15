import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: SingleChildScrollView(
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [ 
              Icon(Icons.handyman_outlined, size: 75,),
              Text("Skill Bridge", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.yellow.shade900),
              ),
              Text("Welcome to the hub of skills!", style: TextStyle( 
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87
              )),
              Text("We Connect!",  style: TextStyle( 
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black87
              )), 
                    
              SizedBox(height: 50,),
              // TextButton(
              //   onPressed: (){
              //     Navigator.pushNamed(context, '/login', arguments: "Hi kaleb");
              //     // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              //     }
              //   , child: Text("login"))
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                GestureDetector(
                onTap: () { 

                },
                child: Container( 
                  // width: 100,
                  padding: EdgeInsets.only(left: 10, right:10,top: 5,bottom: 5),
                  decoration: BoxDecoration( 
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text("login"),
                ),
              ), 
              SizedBox(width: 15,),
            GestureDetector(
                onTap: () { 

                },
                child: Container( 
                  // width: 100,
                  padding: EdgeInsets.only(left: 10, right:10,top: 5,bottom: 5),
                  decoration: BoxDecoration( 
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(" signup"),
                ),
    )
              ],)
          
          
            ],
          ),
        ),
      ),
    );
  }
}