import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/screens/customer_profile.dart';
import 'package:skill_trade/presentation/screens/signup_page.dart';
import 'package:skill_trade/presentation/widgets/my_button.dart';
import 'package:skill_trade/presentation/widgets/my_textfield.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); 
  String _selectedRole = "Customer";


  @override
  void initState() {
    super.initState();
    _selectedRole = 'Customer';
  }


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
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 70, 15, 70),
                  child: Form(
                    key: _formKey,
                    child: Column( 
                      mainAxisAlignment: MainAxisAlignment.center,
                    
                      children: [ 
                        Text("Welcome to SkillTrade Hub!", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                        SizedBox(height: 35,),
                        MyTextField(labelText: "email", prefixIcon: Icons.person_2_outlined,suffixIcon: Icons.edit, toggleText: false , controller: _emailController),
                        SizedBox(height: 15,),
                        MyTextField(labelText: "password", prefixIcon: Icons.lock_open, suffixIcon: Icons.remove_red_eye_rounded, toggleText: true, controller: _passwordController, obscureText: true,),
                        SizedBox(height: 15,),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.,
                          children: [
                            Radio<String>(
                              value: 'Customer',
                              groupValue: _selectedRole,
                              onChanged: (value) {
                                setState(() {
                                  _selectedRole = value!;
                                });
                              },
                            ),
                            Text('Customer'),
                            // SizedBox(width: 15,),
                            Radio<String>(
                              value: 'Technician',
                              groupValue: _selectedRole,
                              onChanged: (value) {
                                setState(() {
                                  _selectedRole = value!;
                                });
                              },
                            ),
                            Text('Technician'),
                            // SizedBox(width: 15,),
                            Radio<String>(
                              value: 'Admin',
                              groupValue: _selectedRole,
                              onChanged: (value) {
                                setState(() {
                                  _selectedRole = value!;
                                });
                              },
                            ),
                            Text('Admin'),
                          ],
                        ),
                        SizedBox(height: 10,),
                        
                        MyButton(text: "login", onPressed: (){ 
                          if(_formKey.currentState!.validate()){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerProfileScreen()));
                          }
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
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
