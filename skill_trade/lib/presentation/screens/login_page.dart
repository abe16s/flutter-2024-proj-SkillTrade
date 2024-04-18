import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/screens/custemer_profile.dart';
import 'package:skill_trade/presentation/screens/signup_page.dart';
import 'package:skill_trade/presentation/widgets/my_button.dart';
import 'package:skill_trade/presentation/widgets/my_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.blueGrey.shade400,
      body: Center( 
        child: SingleChildScrollView( 
          child: Column( 
            children: [ 
              Card( 
                
                color: Colors.white,
                margin: EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 70, 15, 70),
                  child: Column( 
                    mainAxisAlignment: MainAxisAlignment.center,
                  
                    children: [ 
                      Text("Welcome to SkillTrade Hub!", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                      SizedBox(height: 35,),
                      MyTextField(labelText: "email", prefixIcon: Icons.person_2_outlined,suffixIcon: Icons.edit, toggleText: false , controller: _emailController),
                      SizedBox(height: 15,),
                      MyTextField(labelText: "password", prefixIcon: Icons.lock_open, suffixIcon: Icons.remove_red_eye_rounded, toggleText: true, controller: _passwordController, obscureText: true,),
                      SizedBox(height: 15,),
                      
                      MyButton(text: "login", onPressed: (){ 
                        Navigator.push(context, MaterialPageRoute(builder: (context) => customerProfile()));

                      }, width: double.infinity),
                      SizedBox(height: 15,),
                      Row( 
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [ 
                          Text("Don't have an account?", style: TextStyle(fontSize: 20)),
                          SizedBox(width: 8,),
                          TextButton(
                            onPressed:  (){ 
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage()));

                          }, child: Text("Sign up", style: TextStyle(fontSize: 20, color: Colors.purple.shade300)))
                        ],
                      )
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}