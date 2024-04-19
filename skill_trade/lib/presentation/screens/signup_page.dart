import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:skill_trade/presentation/screens/customer_profile.dart';
import 'package:skill_trade/presentation/screens/login_page.dart';
import 'package:skill_trade/presentation/widgets/my_button.dart';
import 'package:skill_trade/presentation/widgets/my_textfield.dart';
import 'package:skill_trade/presentation/widgets/technician_application.dart';




class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _user_role = "customer";
  Color _borderColor1 = Colors.blue;
  Color _borderColor2 = Colors.black;
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _experienceController = TextEditingController();
  TextEditingController _educationController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _bioController = TextEditingController();



  List<String> _selectedTags = [];

  List<String> _availableTags = [
    'Electricity',
    'HVAC',
    'Satelite dish',
    'Plumbing',
    'Electronics',
    'interior decoration',

  ];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  bool _noSkillChosen = false;




  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.blueGrey.shade400,
      body: Center( 
        child: SingleChildScrollView( 
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Column( 
            children: [ 
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Card( 
                  
                  color: Colors.white,
                  margin: EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 70, 15, 70),
                    child: Column( 
                      mainAxisAlignment: MainAxisAlignment.center,
                    
                      children: [ 
                        Text("Welcome to SkillTrade Hub!", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                        SizedBox(height: 15,),
                        Text("SignUp", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                        SizedBox(height: 35,),
                        Row( 
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [ 
                            Column( 
                              children: [ 
                                Text("Customer", style: TextStyle(fontSize: 20, color: _borderColor1,)),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _user_role = "customer";
                                      _borderColor1 = Colors.blue;
                                      _borderColor2 = Colors.black;

                                    });
                                  },
                                  child: CircleAvatar(
                                      backgroundImage: AssetImage('assets/profile.jpg'),
                                      radius: 30,
                                      backgroundColor: _borderColor1,
                                    ),
                                ),
                              ],
                            ),
                            SizedBox(width: 20,),
                            Column( 
                              children: [ 
                                Text("Technician", style: TextStyle(fontSize: 20, color: _borderColor2,)),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _user_role = "technician";
                                      _borderColor2 = Colors.blue;
                                      _borderColor1 = Colors.black;
                                      
                                    });
                                  },
                                  child: CircleAvatar(
                                      backgroundImage: AssetImage('assets/technician.jpg'),
                                      radius: 30,
                                      backgroundColor: _borderColor2,
                                      
                                    ),
                                ),
                                
                              ],
                            )
                
                          ],
                        ),
                        Form( 
                          key: _formKey,
                          child: Column( 
                            children: [ 
                              SizedBox(height: 15,),
                        MyTextField(labelText: "Fullname", prefixIcon: Icons.person_2_outlined, toggleText: false , controller: _fullNameController),
                        SizedBox(height: 15,),
                        MyTextField(labelText: "email", prefixIcon: Icons.email, toggleText: false , controller: _emailController),
                        SizedBox(height: 15,),
                        MyTextField(labelText: "phone", prefixIcon: Icons.phone, toggleText: false , controller: _phoneController),
                        SizedBox(height: 15,),
                        MyTextField(labelText: "password", prefixIcon: Icons.lock_open, suffixIcon: Icons.remove_red_eye_rounded, toggleText: true, controller: _passwordController, obscureText: true,),
                        SizedBox(height: 15,),
                
                        if(_user_role == "technician")...[
                          MyTextField(labelText: "Experience", prefixIcon: Icons.timelapse_sharp, toggleText: false , controller: _experienceController),
                          
                          SizedBox(height: 15,),
                          MyTextField(labelText: "Education Level", prefixIcon: Icons.school, toggleText: false , controller: _educationController),
                          SizedBox(height: 15,),
                          MyTextField(labelText: "Available location", prefixIcon: Icons.location_city_outlined, toggleText: false , controller: _locationController),
                          SizedBox(height: 15,),
                          MyTextField(labelText: "Additional Bio", prefixIcon: Icons.edit, multiline:true, requiredField: false, toggleText: false , controller: _bioController),
                          SizedBox(height: 15,),

                          Container(
                            decoration: BoxDecoration( 
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                              border: _noSkillChosen ? Border.all(color: Colors.red) : null,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row( 
                                    children: [ 
                                      Icon(Icons.handyman_outlined, color: Colors.grey.shade600, size: 25,),
                                      SizedBox(width: 8,),
                                      Text("Skills", style:  TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16.0,
                                    ),),
                                    if(_noSkillChosen)...[ 
                                      SizedBox(width: 8,),
                                      Text("You have to choose at least one skill.", 
                                      style:  TextStyle(
                                      color: Colors.red,
                                      fontSize: 12.0,
                                    ),),

                                    ]

                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
                              
                                Row(
                                  children: [
                                    Expanded(
                                      child: Wrap(
                                        spacing: 5,
                                        children: _availableTags
                                            .map(
                                              (tag) => Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: InputChip(
                                                                                    
                                                  label: Text(tag),
                                                  
                                                  selected: _selectedTags.contains(tag),
                                                  onSelected: (bool selected) {
                                                    setState(() {
                                                      if (selected) {
                                                        _selectedTags.add(tag);
                                                      } else {
                                                        _selectedTags.remove(tag);
                                                      }
                                                    });
                                                  },
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  ],
                                ),
                                if(_noSkillChosen)...[ 

                                ]
                               
                              ],
                            ),
                          ),
                          SizedBox(height: 15,),
                          MyButton(text: "Apply", onPressed: (){ 
                            if(_formKey.currentState!.validate()){
                              if (_selectedTags.length > 0){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => TechnicianApplication()));

                              } else{ 
                                setState(() {
                                  _noSkillChosen = true;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('You have to choose at least one skill.')),
                                );
                              }

                            } 
                
                        }, width: double.infinity),
                        ],
                        if(_user_role == "customer")...[
                          SizedBox(height: 15,),
                          MyButton(text: "signup", onPressed: (){ 
                            if(_formKey.currentState!.validate()){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => customerProfile()));
                            }
                        }, width: double.infinity),
                        ],

                            ],
                          )
                        ),
                        
                        

                        
                        SizedBox(height: 15,),
                        Row( 
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [ 
                            Text("Have an account?", style: TextStyle(fontSize: 20)),
                            SizedBox(width: 8,),
                            TextButton(
                              onPressed:  (){ 
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                
                            }, child: Text("Login", style: TextStyle(fontSize: 20, color: Colors.purple.shade300)))
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