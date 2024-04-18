import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skill_trade/presentation/screens/login_page.dart';
import 'package:skill_trade/presentation/screens/signup_page.dart';
import 'package:skill_trade/presentation/widgets/my_button.dart';
import 'package:skill_trade/presentation/widgets/services_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final List servicesCards = const [
    ServicesCard(imageUrl: 'assets/plumbing.jpg', title:"Plumbing Services", description: "Our expert plumbers are ready to tackle any plumbing issue in your home. From leaks to pipe installations, we ensure quality workmanship."),
    ServicesCard(imageUrl: 'assets/electrician.jpeg', title:"Electrical Work", description: "Need electrical repairs or installations? Our skilled electricians are trained to handle a wide range of electrical services, ensuring your home's safety."),
    ServicesCard(imageUrl: 'assets/hvac.jpg', title:"HVAC Maintainance", description: "Keep your home comfortable year-round with our HVAC maintenance services. Our technicians will keep your heating and cooling systems in top condition."),
    ServicesCard(imageUrl: 'assets/technician.jpg', title:"Satelite Dish Work", description: "Is your desh-technician acting up? Our technicians specialize in dish repair, ensuring your household devices work efficiently."),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: SingleChildScrollView(
          child: Column( 
            children: [ 
              Padding( 
                padding: EdgeInsets.only(top: 100),
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [ 
                    Icon(Icons.handyman_outlined, size: 75,),
                  Text("SkillTrade Hub", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.yellow.shade900),
                  ),
                  Text("Welcome to the hub of skills!", style: TextStyle( 
                    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87
                  )),
                  SizedBox(height: 10,),
                Text("We Connect!",  style: TextStyle( 
                    fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black87
                  )), 
                SizedBox(height: 20,),
                              Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ 
                  MyButton(text: "login", onPressed: (){ 
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  }),
                  SizedBox(width: 15,),

                  MyButton(text: "signup", onPressed: (){ 
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                  }),
                



                  ],),
              
                      ],
                    ),
              ),
              const SizedBox(height: 50,),
              // Divider(),
              const Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Find Skilled Technicians for Your Home Services", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold,)),
              ),
              const SizedBox(height: 7,),
              const Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Efficiently connect with experts in plumbing, electrical work, HVAC, and more.", style: TextStyle(color: Colors.black, fontSize: 20,)),
              ),
              const SizedBox(height: 10,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: const Text("Our Services", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), ),
                  ),
                  ],
                ),
              
              // const SizedBox( height: 20,),
              SizedBox( 
                height: 500,
                child: ListView.builder( 
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                itemCount: servicesCards.length,
                itemBuilder: (context, index) {
                  return servicesCards[index];
                },
                
              ),
              ),

            Container( 
              padding: EdgeInsets.all(8),
              color: Colors.grey.shade300,
              child:  Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  Text("Copyright "),
                  Icon(Icons.copyright_rounded),
                  Text("all rights reserved.")
                ],
              )

                
            )
                
            ],
          
          
          ),
        ),
      ),
    );
  }
}

